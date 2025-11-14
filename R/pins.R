#' Write a dataset to a Cloudflare R2 board
#'
#' This function uploads an R object (typically a data frame) to a specified
#' Cloudflare R2 bucket using the `pins` package.
#'
#' @details
#' Authentication requires three environment variables to be set:
#' \itemize{
#'   \item `R2_ACCOUNT_ID`: Your Cloudflare account ID.
#'   \item `R2_ACCESS_KEY_ID`: Your R2 access key ID.
#'   \item `R2_SECRET_ACCESS_KEY`: Your R2 secret access key.
#' }
#'
#' @param x The object to pin.
#' @param name The name for the pin.
#' @param bucket The name of the R2 bucket to write to.
#' @param description A text description for the pin.
#' @param ... Additional arguments passed on to `pins::pin_write()`.
#'
#' @return The pin metadata, invisibly.
#' @importFrom pins board_s3 pin_write
#' @export
#'
nhanes_pin_write <- function(x, name, bucket, description = "", ...) {
  
  # Check for required environment variables
  required_vars <- c('R2_ACCOUNT_ID', 'R2_ACCESS_KEY_ID', 'R2_SECRET_ACCESS_KEY')
  missing_vars <- required_vars[!required_vars %in% names(Sys.getenv())]
  
  if (length(missing_vars) > 0) {
    stop(
      "Cannot find required environment variables for R2 authentication: ",
      paste(missing_vars, collapse = ", ")
    )
  }
  
  # Construct endpoint URL
  endpoint <- sprintf(
    'https://%s.r2.cloudflarestorage.com',
    Sys.getenv('R2_ACCOUNT_ID')
  )
  
  # Create a board connection
  board <- pins::board_s3(
    bucket = bucket,
    endpoint = endpoint,
    access_key = Sys.getenv('R2_ACCESS_KEY_ID'),
    secret_access_key = Sys.getenv('R2_SECRET_ACCESS_KEY'),
    region = 'auto'
  )
  
  # Write the data to the board
  pins::pin_write(
    board = board,
    x = x,
    name = name,
    type = 'parquet',
    description = description,
    versioned = TRUE,
    ...
  )
  
  message(sprintf("Successfully wrote '%s' to the '%s' bucket.", name, bucket))
}
