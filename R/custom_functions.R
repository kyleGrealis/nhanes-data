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
#' @seealso
#'   * [tidyselect::eval_select()] for variable selection syntax
#'   * [attributes()] for information about R object attributes
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
#' @importFrom tidyselect eval_select
#' @importFrom rlang enquos
#' @export
drop_label_kyle <- function(df, ...) {
  # Capture variable selection using tidyselect
  selected_vars <- tidyselect::eval_select(
    rlang::expr(c(...)),
    data = df
  )

  # Remove attributes from selected columns
  for (var_name in names(selected_vars)) {
    attributes(df[[var_name]]) <- NULL
  }

  return(df)
}


#-------------------------------------------------------
#' Confirmation check
#' @importFrom cli col_green col_yellow col_br_magenta
#' @importFrom stringr str_detect str_to_lower
#' @noRd
.read_this <- function() {
  answer <- readline(
    message(cli::col_green('Did you read the note about DXX variables above?? [y/N]'))
  )
  if (stringr::str_detect(stringr::str_to_lower(answer), 'y|yes')) {
    message(cli::col_yellow('Good! Read it again and then proceed :)'))
  } else {
    message(cli::col_br_magenta('Why do I even write this stuff?! Read it!!!'))
    .read_this()
  }
}