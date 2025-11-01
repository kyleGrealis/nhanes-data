library(tidyverse)
library(pins)
library(arrow)

# Read the test file from the public R2 URL:
read_r2 <- function(dataset, type = 'parquet') {
  arrow::read_parquet(
    file = sprintf(
      # 'https://pub-0ecceb5aa4654213b72c34b6e0895355.r2.dev/%s.%s',
      'https://nhanes.kylegrealis.com/%s.%s',
      dataset,
      type
    )
  )
}
trigly <- read_r2('trigly')
acq <- read_r2('acq')

acq2 <- arrow::read_parquet('~/Downloads/acq.parquet')
