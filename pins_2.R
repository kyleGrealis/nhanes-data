# Set up write access to the R2 bucket
library(pins)

# Create a test dataset
test_data <- tibble::tibble(
  id = 1:10,
  value = rnorm(10) * 8
)

# Store endpoint URL
endpoint <- sprintf(
    'https://%s.r2.cloudflarestorage.com',
    Sys.getenv('R2_ACCOUNT_ID')
  )

# Create board by connecting to Cloudflare R2 S3 bucket
board <- board_s3(
  bucket = 'test-pins-bucket',
  endpoint = endpoint,
  access_key = Sys.getenv('R2_ACCESS_KEY_ID'),
  secret_access_key = Sys.getenv('R2_SECRET_ACCESS_KEY'),
  region = 'auto'
)

# Write the data to the board
pin_write(
  board = board, 
  x = test_data, 
  name = 'test-dataset', 
  type = 'parquet',
  description = 'This is an example dataset :)', 
  versioned = TRUE,
  metadata = list(
    'owner' = 'Kyle',
    'author' = 'teek',
    'date' = 'today, of course'
  )
)

# Retrieve pin information from board
pin_versions(board, 'test-dataset')
# Retrieve the actual test data
pin_read(board, 'test-dataset')

# Load data from data/raw/parquet file
acq <- arrow::read_parquet('data/raw/parquet/acq.parquet')
# Add data to board
pin_write(
  board,
  acq,
  name = 'acq',
  type = 'parquet',
  description = 'some attribute stuff from nhanes questionnaire',
  versioned = TRUE
)
system.time(
  pin_read(board, 'acq')
)




acq2 <- arrow::read_parquet('https://pub-2c4219e725e544f5b237ad0b8c99ec94.r2.dev/acq%20nhanes%20data/20251027T021547Z-a7a19/acq%20nhanes%20data.parquet')

#--------------------------------------
# Custom function to retrieve data from real data bucket
read_nhanes <- function(dataset) {
  arrow::read_parquet(
    sprintf(
      'https://pub-0ecceb5aa4654213b72c34b6e0895355.r2.dev/%s.parquet',
      dataset
    )
  )
}
read_nhanes('acq')
