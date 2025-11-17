library(testthat)
library(nhanesdata)

# Test find_variable() ------------------------------------------------------------
# Note: These tests modify .GlobalEnv but clean up after themselves

test_that("find_variable finds variable in single dataset", {
  # Create test data in global environment
  .GlobalEnv$test_dataset1 <- data.frame(
    record_id = 1:5,
    age = 20:24,
    gender = c("M", "F", "M", "F", "M")
  )

  # Ensure cleanup
  on.exit(rm("test_dataset1", envir = .GlobalEnv), add = TRUE)

  result <- find_variable("record_id")
  expect_true("test_dataset1" %in% result)
})

test_that("find_variable finds variable in multiple datasets", {
  .GlobalEnv$test_ds1 <- data.frame(record_id = 1:5, age = 20:24)
  .GlobalEnv$test_ds2 <- data.frame(participant_id = 1:3, record_id = 1:3, sex = c("M", "F", "M"))
  .GlobalEnv$test_ds3 <- data.frame(record_id = 1:10, height = 150:159)

  on.exit({
    rm(list = c("test_ds1", "test_ds2", "test_ds3"), envir = .GlobalEnv)
  }, add = TRUE)

  result <- find_variable("record_id")

  # Should find all three datasets
  expect_true(all(c("test_ds1", "test_ds2", "test_ds3") %in% result))
  expect_true(length(result) >= 3)
})

test_that("find_variable returns informative message when variable not found", {
  .GlobalEnv$test_data_x <- data.frame(x = 1:5, y = 6:10)

  on.exit(rm("test_data_x", envir = .GlobalEnv), add = TRUE)

  result <- find_variable("nonexistent_var_xyz")
  expect_match(result, "Variable 'nonexistent_var_xyz' not found in any dataset")
})

test_that("find_variable is case-sensitive", {
  .GlobalEnv$test_case_sens <- data.frame(RecordID = 1:5, age = 20:24)

  on.exit(rm("test_case_sens", envir = .GlobalEnv), add = TRUE)

  # Exact case match should find it
  result1 <- find_variable("RecordID")
  expect_true("test_case_sens" %in% result1)

  # Different case should not find it
  result2 <- find_variable("recordid")
  expect_match(result2, "not found")

  result3 <- find_variable("RECORDID")
  expect_match(result3, "not found")
})

test_that("find_variable ignores non-data.frame objects", {
  .GlobalEnv$test_df_only <- data.frame(record_id = 1:5)
  .GlobalEnv$test_not_df <- list(record_id = 1:10)
  .GlobalEnv$test_also_not <- c(record_id = 99)

  on.exit({
    rm(list = c("test_df_only", "test_not_df", "test_also_not"), envir = .GlobalEnv)
  }, add = TRUE)

  result <- find_variable("record_id")

  # Should only find test_df_only (the actual data frame)
  expect_true("test_df_only" %in% result)
  expect_false("test_not_df" %in% result)
  expect_false("test_also_not" %in% result)
})

test_that("find_variable works with tibbles", {
  skip_if_not_installed("tibble")

  .GlobalEnv$test_tibble <- tibble::tibble(record_id = 1:5, age = 20:24)
  .GlobalEnv$test_regular <- data.frame(record_id = 1:3)

  on.exit({
    rm(list = c("test_tibble", "test_regular"), envir = .GlobalEnv)
  }, add = TRUE)

  result <- find_variable("record_id")

  # Both tibble and data frame should be found
  expect_true("test_tibble" %in% result)
  expect_true("test_regular" %in% result)
})

test_that("find_variable handles data frames with no columns", {
  .GlobalEnv$test_empty <- data.frame()
  .GlobalEnv$test_normal <- data.frame(record_id = 1:5)

  on.exit({
    rm(list = c("test_empty", "test_normal"), envir = .GlobalEnv)
  }, add = TRUE)

  result <- find_variable("record_id")
  expect_true("test_normal" %in% result)
  expect_false("test_empty" %in% result)

  result2 <- find_variable("nonexistent")
  expect_match(result2, "not found")
})

test_that("find_variable returns character vector", {
  .GlobalEnv$test_vec1 <- data.frame(x = 1:5)
  .GlobalEnv$test_vec2 <- data.frame(x = 6:10)

  on.exit({
    rm(list = c("test_vec1", "test_vec2"), envir = .GlobalEnv)
  }, add = TRUE)

  result <- find_variable("x")
  expect_type(result, "character")
  expect_true(length(result) >= 2)
})

test_that("find_variable handles special column names", {
  .GlobalEnv$test_special <- data.frame(
    `column with spaces` = 1:5,
    `column.with.dots` = 6:10,
    `column_with_underscores` = 11:15,
    check.names = FALSE
  )

  on.exit(rm("test_special", envir = .GlobalEnv), add = TRUE)

  result1 <- find_variable("column with spaces")
  expect_true("test_special" %in% result1)

  result2 <- find_variable("column.with.dots")
  expect_true("test_special" %in% result2)

  result3 <- find_variable("column_with_underscores")
  expect_true("test_special" %in% result3)
})

test_that("find_variable works with data.table", {
  skip_if_not_installed("data.table")

  .GlobalEnv$test_dt <- data.table::data.table(record_id = 1:5, value = 10:14)
  .GlobalEnv$test_df <- data.frame(record_id = 1:3)

  on.exit({
    rm(list = c("test_dt", "test_df"), envir = .GlobalEnv)
  }, add = TRUE)

  result <- find_variable("record_id")

  # Both should be found (data.table inherits from data.frame)
  expect_true("test_dt" %in% result)
  expect_true("test_df" %in% result)
})

test_that("find_variable handles duplicate variable names across datasets", {
  .GlobalEnv$test_demo <- data.frame(seqn = 1:10, age = 20:29, gender = sample(c("M", "F"), 10, replace = TRUE))
  .GlobalEnv$test_lab <- data.frame(seqn = 1:10, cholesterol = rnorm(10), triglycerides = rnorm(10))
  .GlobalEnv$test_exam <- data.frame(seqn = 1:10, weight = rnorm(10), height = rnorm(10))

  on.exit({
    rm(list = c("test_demo", "test_lab", "test_exam"), envir = .GlobalEnv)
  }, add = TRUE)

  # seqn appears in all three
  result_seqn <- find_variable("seqn")
  expect_true(all(c("test_demo", "test_lab", "test_exam") %in% result_seqn))

  # age only in demo
  result_age <- find_variable("age")
  expect_true("test_demo" %in% result_age)
  expect_false("test_lab" %in% result_age)

  # cholesterol only in lab
  result_chol <- find_variable("cholesterol")
  expect_true("test_lab" %in% result_chol)
  expect_false("test_demo" %in% result_chol)
})

test_that("find_variable handles numeric variable names", {
  .GlobalEnv$test_numeric_cols <- data.frame(
    `1` = 1:5,
    `2` = 6:10,
    check.names = FALSE
  )

  on.exit(rm("test_numeric_cols", envir = .GlobalEnv), add = TRUE)

  result <- find_variable("1")
  expect_true("test_numeric_cols" %in% result)
})

test_that("find_variable message format is correct", {
  .GlobalEnv$test_format <- data.frame(x = 1:5)

  on.exit(rm("test_format", envir = .GlobalEnv), add = TRUE)

  result <- find_variable("nonexistent_var_12345")

  # Check message format
  expect_type(result, "character")
  expect_match(result, "^Variable")
  expect_match(result, "not found in any dataset$")
  expect_match(result, "'nonexistent_var_12345'")
})

test_that("find_variable doesn't crash with complex global environment", {
  # Create various objects
  .GlobalEnv$test_complex_df <- data.frame(target = 1:5, other = 6:10)
  .GlobalEnv$test_complex_list <- list(a = 1, b = 2)
  .GlobalEnv$test_complex_func <- function(x) x + 1
  .GlobalEnv$test_complex_vec <- 1:100

  on.exit({
    rm(list = c("test_complex_df", "test_complex_list", "test_complex_func", "test_complex_vec"),
       envir = .GlobalEnv)
  }, add = TRUE)

  # Should not error
  expect_silent({
    result <- find_variable("target")
  })

  expect_true("test_complex_df" %in% result)
})

test_that("find_variable returns unique dataset names", {
  .GlobalEnv$test_unique_a <- data.frame(myvar = 1:5)
  .GlobalEnv$test_unique_b <- data.frame(myvar = 6:10)

  on.exit({
    rm(list = c("test_unique_a", "test_unique_b"), envir = .GlobalEnv)
  }, add = TRUE)

  result <- find_variable("myvar")

  # Should have no duplicates
  expect_equal(length(result), length(unique(result)))
  expect_true(all(c("test_unique_a", "test_unique_b") %in% result))
})
