#----------------------------------------------------------------------------------------
#' Custom function to retrieve the codebook URL
#' @param table Character. The table where variable information is needed.
#' @returns Full URL to CDC data documentation, codebook, & frequencies.
#' @importFrom nhanesA nhanesManifest
#' @importFrom dplyr filter pull
#' @export
get_url <- function(table) {
  paste0(
    "https://wwwn.cdc.gov",
    nhanesA::nhanesManifest() |> 
      dplyr::filter(Table == table) |>
      dplyr::pull(DocURL)
  ) |> 
  message()
}

#----------------------------------------------------------------------------------------
#' Custom wrapped function to nhanesA::nhanesSearch for concise output
#' @param var Character. Term or phrase to search
#' @returns Smaller output dataset
#' @importFrom nhanesA nhanesSearch
#' @importFrom dplyr select arrange desc
#' @export
term_search <- function(var) {
  nhanesA::nhanesSearch(var, ignore.case = TRUE) |> 
  dplyr::select(1:3, Begin.Year) |> 
  dplyr::arrange(dplyr::desc(`Begin.Year`), `Variable.Name`)
}

#----------------------------------------------------------------------------------------
#' Custom wrapped function to nhanes::nhanesSearchVarName for concise output
#' @param var Character. Variable name
#' @returns Smaller output dataset
#' @importFrom nhanesA nhanesSearchVarName
#' @importFrom stringr str_to_upper
#' @export
var_search <- function(var) {
  nhanesA::nhanesSearchVarName(stringr::str_to_upper(var))
}

#----------------------------------------------------------------------------------------
#' Function to pull all datasets with the same base name
#' @param nhanes_table Character. NOT case-sensitive! Lowercase is allowed.
#' @param selected_variables Character vector. Default is NULL to grab all variables
#' from the dataset. Do not use `everything()`... just don't enter an argument value.
#' @param save Logical. Save as new .rda and .parquet files. Default is TRUE
#' @returns Tibble of datasets across cycles; using `bind_rows()`.
#' @importFrom stringr str_to_upper
#' @importFrom tibble tibble
#' @importFrom nhanesA nhanes
#' @importFrom dplyr mutate select any_of bind_rows
#' @importFrom janitor clean_names
#' @importFrom fs dir_exists dir_create
#' @importFrom arrow write_parquet
#' @importFrom scales comma
#' @export
pull_nhanes <- function(nhanes_table, selected_variables = NULL, save = TRUE) {

  nhanes_table <- stringr::str_to_upper(nhanes_table)
  message(sprintf('\nDataset: %s', nhanes_table))

  # Starting with B through L, skipping K
  table_suffixes <- c(LETTERS[2:10], LETTERS[12])

  start_dfr <- tibble::tibble(
    # Append the suffix to tables. First table has no letter suffix.
    # Will create something like DEMO_B & LAB_X
    code = c(nhanes_table, paste0(nhanes_table, '_', table_suffixes)),
    # The data for 2019-2020 was not collected the same way. See full docs.
    # This creates years: 1999-2017 & 2021
    year = c(seq(1999, 2017, by = 2), 2021)
  )

  # Initialize dataset
  combined_data <- tibble::tibble()

  for (i in seq_len(nrow(start_dfr))) {
    code <- start_dfr$code[i]  # the dataset name with suffix
    yr   <- start_dfr$year[i]  # corresponding year

    message(sprintf('Processing NHANES data for year: %s', yr))
    data <- nhanesA::nhanes(code)

    # Skip if dataset doesn't exist
    if (is.null(data)) {
      message(sprintf('Dataset %s not available, skipping...', code))
      next
    }

    if (is.null(selected_variables)) {
      current_data <- data |> dplyr::mutate(year = yr, .before = 1) |> janitor::clean_names()
    } else {
      # Select only certain variables if a vector was passed
      current_data <- data |> 
        dplyr::select(dplyr::any_of(stringr::str_to_upper(selected_variables))) |>
        dplyr::mutate(year = yr, .before = 1) |> janitor::clean_names()
    }

    if (nrow(combined_data) == 0) {
      combined_data <- current_data
    } else {
      combined_data <- tryCatch({
        dplyr::bind_rows(combined_data, current_data)
      }, error = function(e) {
        # Previous attmempts to combine data from multiple cycles has led to type
        # mismatching: one was factor while the other was character, you get the point...
        # Find the common variables and attempt to harmonize types
        common_cols <- intersect(names(combined_data), names(current_data))

        for (col in common_cols) {
          if (col == 'year') next

          existing_var_type <- typeof(combined_data[[col]])
          entering_var_type <- typeof(current_data[[col]])

          if (existing_var_type != entering_var_type) {
            message(sprintf(
              'Type mismatch in %s: %s vs %s... converting types now...', 
              col, existing_var_type, entering_var_type
            ))
            num_types <- c('double', 'integer')
            if (existing_var_type %in% num_types & entering_var_type %in% num_types) {
              combined_data[[col]] <- as.double(combined_data[[col]])
              current_data[[col]]  <- as.double(current_data[[col]])
            } else {
              combined_data[[col]] <- as.character(combined_data[[col]])
              current_data[[col]]  <- as.character(current_data[[col]])
            }
          }
        }

        dplyr::bind_rows(combined_data, current_data)
      })
    }
  }

  mapped_dfr <- combined_data |> 
    dplyr::mutate(
      year = as.integer(year),
      seqn = as.integer(seqn)
    )

  if (save) {
    # Save the data in data/raw:
    if (!fs::dir_exists('data/raw/R')) {
      fs::dir_create('data/raw/R', recurse = TRUE)
    }
    if (!fs::dir_exists('data/raw/parquet')) {
      fs::dir_create('data/raw/parquet', recurse = TRUE)
    }

    # Save as .rda file (the object name will match the table name)
    save(
      list = tolower(nhanes_table),
      file = sprintf('data/raw/R/%s.rda', tolower(nhanes_table))
    )

    # Save as .parquet
    arrow::write_parquet(
      mapped_dfr,
      sprintf('data/raw/parquet/%s.parquet', tolower(nhanes_table))
    )
  }

  message(
    sprintf(
      'Number of rows for %s: %s',
      nhanes_table,
      scales::comma(nrow(mapped_dfr))
    )
  )

  return(mapped_dfr)
}

#-------------------------------------------------------
#' Read the dataset files from the public NHANES storage:
#' @param dataset Character. NHANES dataset base name. Not case sensitive.
#' @param type Character. Either "parquet" (faster) or "rda".
#' @details This function downloads NHANES data file from nhanes.kylegrealis.com.
#' @examples
#' trigly <- read_r2('trigly')
#' acq <- read_r2('acq')
#' @importFrom arrow read_parquet
#' @export
read_r2 <- function(dataset, type = 'parquet') {
  dataset <- tolower(dataset)
  message(sprintf('Loading: %s', toupper(dataset)))
  ds <- arrow::read_parquet(
    file = sprintf(
      # 'https://pub-0ecceb5aa4654213b72c34b6e0895355.r2.dev/%s.%s',
      'https://nhanes.kylegrealis.com/%s.%s',
      dataset,
      type
    )
  )
  message(sprintf('%s complete!', toupper(dataset)))
  return(ds)
}
