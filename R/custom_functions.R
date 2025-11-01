#' Find a variable across all data frames in the global environment
#' 
#' @description Searches through all data frame objects in the global environment
#'   to identify which datasets contain a specified variable name. Useful for 
#'   exploratory data analysis when working with multiple datasets and trying
#'   to locate where specific variables are stored.
#' 
#' @param var_name Character string specifying the variable name to search for
#' 
#' @returns A character vector of dataset names containing the variable, or an 
#'   informative message if the variable is not found in any dataset
#' 
#' @details The function examines all objects in the global environment, filters
#'   for data frame objects, and checks if the specified variable exists in each
#'   dataset's column names. The search is case-sensitive and looks for exact
#'   variable name matches.
#' 
#' @examples
#' # Create some example datasets
#' df1 <- data.frame(record_id = 1:5, age = 20:24)
#' df2 <- data.frame(participant_id = 1:3, record_id = 1:3, sex = c("M", "F", "M"))
#' 
#' # Find which datasets contain 'record_id'
#' find_variable('record_id')
#' # Returns: c("df1", "df2")
#' 
#' # Search for a variable that doesn't exist
#' find_variable('height')
#' # Returns: "Variable 'height' not found in any dataset"
#' 
#' @export
find_variable <- function(var_name) {
 # Get all objects in the global environment
 all_objects <- ls(envir = .GlobalEnv)

 # Create a vector to store results
 found_in <- character(0)

 # Loop through objects and check their names
 for (obj_name in all_objects) {
   # Skip the function itself to avoid self-reference
   if (obj_name == "find_variable") {
     next
   }

   # Get the object from global environment
   obj <- get(obj_name, envir = .GlobalEnv)

   # Check if it's a data frame and contains the target variable
   if (is.data.frame(obj) && var_name %in% names(obj)) {
     found_in <- c(found_in, obj_name)
   }
 }

 # Return results with informative message if not found
 if (length(found_in) == 0) {
   return(paste0("Variable '", var_name, "' not found in any dataset"))
 } else {
   return(found_in)
 }
}


#' Drop labels from selected variables in a data frame
#' 
#' @description Removes variable labels (attributes) from specified columns in a 
#'   data frame. This function addresses reported issues with data joins where
#'   variable labels can cause conflicts. Supports flexible variable selection
#'   using tidyselect syntax including helper functions and direct column names.
#'   
#'   Note: This is an adaptation of functionality being proposed for integration
#'   into the tidyREDCap package.
#'
#' @param df A data frame containing labeled variables
#' @param ... Variable selection using tidyselect helpers (e.g., `contains()`,
#'   `starts_with()`) or column names as symbols or strings
#'
#' @returns The input data frame with labels (attributes) removed from selected variables
#'
#' @details The function uses `tidyselect::eval_select()` to support flexible
#'   variable selection patterns. It removes all attributes from selected columns,
#'   which includes variable labels but also other metadata. Use with caution if
#'   you need to preserve specific attributes other than labels.
#'
#' @examples
#' \dontrun{
#' # Remove labels from a single variable
#' labeled_data |> drop_label_kyle(employment)
#'
#' # Remove labels from multiple specific variables
#' labeled_data |> drop_label_kyle(employment, marital_status, income)
#'
#' # Remove all demographic labels using tidyselect helpers
#' labeled_data |> drop_label_kyle(starts_with("dem_"))
#' 
#' # Remove labels from variables containing specific text
#' labeled_data |> drop_label_kyle(contains("score"))
#' 
#' # Chain with other data processing steps
#' study_data |> 
#'   drop_label_kyle(starts_with("baseline_")) |>
#'   left_join(lookup_table, by = "participant_id")
#' }
#'
#' @seealso 
#' * [tidyselect::eval_select()] for variable selection syntax
#' * [attributes()] for information about R object attributes
#'
#' @export
drop_label_kyle <- function(df, ...) {
 # Capture the variables using tidyselect for flexible selection
 vars_idx <- tidyselect::eval_select(rlang::expr(c(...)), df)

 # If no variables selected, return the dataframe unchanged
 if (length(vars_idx) == 0) return(df)

 # Remove all attributes from each selected column
 # This eliminates labels while preserving the underlying data
 for (col_idx in vars_idx) {
   attributes(df[[col_idx]]) <- NULL
 }

 return(df)
}


#-----------------------------------------------------------------------------

# This URL will direct you to the list of interviewer manuals & questionnaire instruments
# https://wwwn.cdc.gov/nchs/nhanes/continuousnhanes/questionnaires.aspx?Cycle=2021-2023

# NOTE: the PDF links on the page provide a questionnaire, but not all variables may be 
# listed compared to when using `nhanes("DIQ_L") |> names()`.
# The custom `get_url()` function is needed to get the link to the full set of variables
# from the codebook!

#----------------------------------------------------------------------------------------
#' Custom function to retrieve the codebook URL
#' @param table Character. The table where variable information is needed.
#' @returns Full URL to CDC data documentation, codebook, & frequencies.
get_url <- function(table) {
  paste0(
    "https://wwwn.cdc.gov",
    nhanesManifest() |> 
      filter(Table == table) |> 
      pull(DocURL)
  ) |> 
  message()
}

#----------------------------------------------------------------------------------------
#' Custom wrapped function to nhanesA::nhanesSearch for concise output
#' @param var Character. Term or phrase to search
#' @returns Smaller output dataset
term_search <- function(var) {
  nhanesA::nhanesSearch(var, ignore.case = TRUE) |> 
  select(1:3, Begin.Year) |> 
  arrange(desc(`Begin.Year`), `Variable.Name`)
}

#----------------------------------------------------------------------------------------
#' Custom wrapped function to nhanes::nhanesSearchVarName for concise output
#' @param var Character. Variable name
#' @returns Smaller output dataset
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
pull_nhanes <- function(nhanes_table, selected_variables = NULL, save = TRUE) {

  nhanes_table <- stringr::str_to_upper(nhanes_table)
  message(sprintf('\nDataset: %s', nhanes_table))

  # Starting with B through L, skipping K
  table_suffixes <- c(LETTERS[2:10], LETTERS[12])

  start_dfr <- tibble(
    # Append the suffix to tables. First table has no letter suffix.
    # Will create something like DEMO_B & LAB_X
    code = c(nhanes_table, paste0(nhanes_table, '_', table_suffixes)),
    # The data for 2019-2020 was not collected the same way. See full docs.
    # This creates years: 1999-2017 & 2021
    year = c(seq(1999, 2017, by = 2), 2021)
  )

  # Initialize dataset
  combined_data <- tibble()

  for (i in seq_len(nrow(start_dfr))) {
    code <- start_dfr$code[i]  # the dataset name with suffix
    yr   <- start_dfr$year[i]  # corresponding year

    message(sprintf('Processing NHANES data for year: %s', yr))
    data <- nhanes(code)

    # Skip if dataset doesn't exist
    if (is.null(data)) {
      message(sprintf('Dataset %s not available, skipping...', code))
      next
    }

    if (is.null(selected_variables)) {
      current_data <- data |> mutate(year = yr, .before = 1) |> janitor::clean_names()
    } else {
      # Select only certain variables if a vector was passed
      current_data <- data |> 
        select(any_of(stringr::str_to_upper(selected_variables))) |> 
        mutate(year = yr, .before = 1) |> janitor::clean_names()
    }

    # browser()

    if (nrow(combined_data) == 0) {
      combined_data <- current_data
    } else {
      combined_data <- tryCatch({
        bind_rows(combined_data, current_data)
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

        bind_rows(combined_data, current_data)
      })
    }
  }

  mapped_dfr <- combined_data |> 
    mutate(
      year = as.integer(year),
      seqn = as.integer(seqn)
    )
  
  # Assign the dataset name
  assign(tolower(nhanes_table), mapped_dfr)

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
  assign(dataset, ds, envir = .GlobalEnv)
  message(sprintf('%s complete!', toupper(dataset)))
}



#-------------------------------------------------------
#' Confirmation check
#' @noRd
.read_this <- function() {
  answer <- readline(
    message(cli::col_green('Did you read the note about DXX variables above?? [y/N]'))
  )
  if (str_detect(str_to_lower(answer), 'y|yes')) {
    message(cli::col_yellow('Good! Read it again and then proceed :)'))
  } else {
    message(cli::col_br_magenta('Why do I even write this stuff?! Read it!!!'))
    .read_this()
  }
}
