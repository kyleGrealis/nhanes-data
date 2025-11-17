library(testthat)
library(nhanesdata)

# Test detect_data_changes() ------------------------------------------------------

test_that("detect_data_changes returns FALSE with warning when file doesn't exist", {
  withr::local_tempdir()

  expect_warning(
    result <- detect_data_changes("nonexistent_file.parquet", "dataset1"),
    "File not found: nonexistent_file.parquet"
  )
  expect_false(result)
})

test_that("detect_data_changes returns TRUE when checksum file doesn't exist", {
  withr::local_tempdir()

  # Create a temporary file
  temp_file <- tempfile(fileext = ".parquet")
  writeLines("fake parquet data", temp_file)

  # Non-existent checksums file
  expect_message(
    result <- detect_data_changes(temp_file, "dataset1", "nonexistent_checksums.json"),
    "NEW dataset"
  )

  expect_true(result)
})

test_that("detect_data_changes returns TRUE for new dataset not in checksums", {
  withr::local_tempdir()

  # Create a temporary file
  temp_file <- tempfile(fileext = ".parquet")
  writeLines("fake parquet data", temp_file)

  # Create checksums file with different dataset
  checksums_file <- "test_checksums.json"
  jsonlite::write_json(
    list(other_dataset = "abc123"),
    checksums_file,
    auto_unbox = TRUE
  )

  expect_message(
    result <- detect_data_changes(temp_file, "new_dataset", checksums_file),
    "NEW dataset \\(no previous checksum\\)"
  )

  expect_true(result)
})

test_that("detect_data_changes returns TRUE when data has changed", {
  withr::local_tempdir()

  # Create first version of file
  temp_file <- tempfile(fileext = ".parquet")
  writeLines("version 1 data", temp_file)

  # Store checksum
  checksums_file <- "test_checksums.json"
  old_hash <- tools::md5sum(temp_file)
  names(old_hash) <- NULL
  jsonlite::write_json(
    list(dataset1 = old_hash),
    checksums_file,
    auto_unbox = TRUE
  )

  # Modify the file
  writeLines("version 2 data - changed!", temp_file)

  expect_message(
    result <- detect_data_changes(temp_file, "dataset1", checksums_file),
    "CHANGED \\(hash mismatch\\)"
  )

  expect_true(result)
})

test_that("detect_data_changes returns FALSE when data is unchanged", {
  withr::local_tempdir()

  # Create file
  temp_file <- tempfile(fileext = ".parquet")
  writeLines("unchanging data", temp_file)

  # Store checksum
  checksums_file <- "test_checksums.json"
  hash_value <- tools::md5sum(temp_file)
  names(hash_value) <- NULL
  jsonlite::write_json(
    list(dataset1 = hash_value),
    checksums_file,
    auto_unbox = TRUE
  )

  # Check again - should be unchanged
  expect_message(
    result <- detect_data_changes(temp_file, "dataset1", checksums_file),
    "UNCHANGED \\(hash match\\)"
  )

  expect_false(result)
})

test_that("detect_data_changes handles multiple datasets in checksums", {
  withr::local_tempdir()

  # Create files
  file1 <- tempfile(fileext = ".parquet")
  file2 <- tempfile(fileext = ".parquet")
  writeLines("data 1", file1)
  writeLines("data 2", file2)

  # Create checksums for both
  checksums_file <- "test_checksums.json"
  hash1 <- tools::md5sum(file1)
  hash2 <- tools::md5sum(file2)
  names(hash1) <- NULL
  names(hash2) <- NULL

  jsonlite::write_json(
    list(dataset1 = hash1, dataset2 = hash2),
    checksums_file,
    auto_unbox = TRUE
  )

  # Both should be unchanged
  expect_message(detect_data_changes(file1, "dataset1", checksums_file), "UNCHANGED")
  expect_message(detect_data_changes(file2, "dataset2", checksums_file), "UNCHANGED")
})


# Test update_checksum() ----------------------------------------------------------

test_that("update_checksum errors when file doesn't exist", {
  withr::local_tempdir()

  expect_error(
    update_checksum("dataset1", "nonexistent_file.parquet"),
    "File not found: nonexistent_file.parquet"
  )
})

test_that("update_checksum creates new checksums file for new dataset", {
  withr::local_tempdir()

  # Create a file
  temp_file <- tempfile(fileext = ".parquet")
  writeLines("new data", temp_file)

  checksums_file <- "new_checksums.json"

  expect_message(
    update_checksum("dataset1", temp_file, checksums_file),
    "Updated checksum for dataset1"
  )

  # Verify file was created
  expect_true(file.exists(checksums_file))

  # Verify contents
  checksums <- jsonlite::read_json(checksums_file, simplifyVector = TRUE)
  expect_equal(names(checksums), "dataset1")
  expect_true(nchar(checksums$dataset1) == 32)  # MD5 hash length
})

test_that("update_checksum updates existing dataset checksum", {
  withr::local_tempdir()

  # Create file
  temp_file <- tempfile(fileext = ".parquet")
  writeLines("version 1", temp_file)

  # Create initial checksums
  checksums_file <- "test_checksums.json"
  jsonlite::write_json(
    list(dataset1 = "old_hash_value"),
    checksums_file,
    auto_unbox = TRUE
  )

  # Update checksum
  update_checksum("dataset1", temp_file, checksums_file)

  # Verify hash was updated
  checksums <- jsonlite::read_json(checksums_file, simplifyVector = TRUE)
  expect_false(checksums$dataset1 == "old_hash_value")
  expect_true(nchar(checksums$dataset1) == 32)
})

test_that("update_checksum preserves other datasets in checksums file", {
  withr::local_tempdir()

  # Create files
  file1 <- tempfile(fileext = ".parquet")
  file2 <- tempfile(fileext = ".parquet")
  writeLines("data 1", file1)
  writeLines("data 2", file2)

  # Create initial checksums with dataset1
  checksums_file <- "test_checksums.json"
  hash1 <- tools::md5sum(file1)
  names(hash1) <- NULL
  jsonlite::write_json(
    list(dataset1 = hash1),
    checksums_file,
    auto_unbox = TRUE
  )

  # Add dataset2
  update_checksum("dataset2", file2, checksums_file)

  # Verify both are present
  checksums <- jsonlite::read_json(checksums_file, simplifyVector = TRUE)
  expect_equal(sort(names(checksums)), c("dataset1", "dataset2"))
  expect_equal(checksums$dataset1, hash1)
})

test_that("update_checksum sorts datasets alphabetically", {
  withr::local_tempdir()

  # Create files
  file_z <- tempfile(fileext = ".parquet")
  file_a <- tempfile(fileext = ".parquet")
  file_m <- tempfile(fileext = ".parquet")
  writeLines("z data", file_z)
  writeLines("a data", file_a)
  writeLines("m data", file_m)

  checksums_file <- "sort_test_checksums.json"

  # Add in non-alphabetical order
  update_checksum("zebra", file_z, checksums_file)
  update_checksum("apple", file_a, checksums_file)
  update_checksum("mango", file_m, checksums_file)

  # Verify sorted order
  checksums <- jsonlite::read_json(checksums_file, simplifyVector = TRUE)
  expect_equal(names(checksums), c("apple", "mango", "zebra"))
})

test_that("update_checksum creates pretty-printed JSON", {
  withr::local_tempdir()

  # Create file
  temp_file <- tempfile(fileext = ".parquet")
  writeLines("test data", temp_file)

  checksums_file <- "test_checksums.json"
  update_checksum("dataset1", temp_file, checksums_file)

  # Read raw file contents
  json_contents <- readLines(checksums_file)

  # Should be multiple lines (pretty printed)
  expect_true(length(json_contents) > 1)

  # Should contain proper indentation
  expect_true(any(grepl("^\\s+", json_contents)))
})

test_that("update_checksum hash is auto-unboxed (string, not array)", {
  withr::local_tempdir()

  # Create file
  temp_file <- tempfile(fileext = ".parquet")
  writeLines("test data", temp_file)

  checksums_file <- "test_checksums.json"
  update_checksum("dataset1", temp_file, checksums_file)

  # Read and verify structure
  json_contents <- readLines(checksums_file, warn = FALSE)
  json_text <- paste(json_contents, collapse = "\n")

  # Should NOT contain array brackets around hash value
  expect_false(grepl('\\["[a-f0-9]{32}"\\]', json_text))

  # SHOULD be a simple string value
  expect_true(grepl('"dataset1":\\s*"[a-f0-9]{32}"', json_text))
})


# Integration test: detect then update -------------------------------------------

test_that("detect_data_changes and update_checksum work together", {
  withr::local_tempdir()

  # Create file
  temp_file <- tempfile(fileext = ".parquet")
  writeLines("initial data", temp_file)

  checksums_file <- "test_checksums.json"

  # First check - should be new
  expect_true(detect_data_changes(temp_file, "dataset1", checksums_file))

  # Update checksum
  update_checksum("dataset1", temp_file, checksums_file)

  # Second check - should be unchanged
  expect_false(detect_data_changes(temp_file, "dataset1", checksums_file))

  # Modify file
  writeLines("modified data", temp_file)

  # Third check - should detect change
  expect_true(detect_data_changes(temp_file, "dataset1", checksums_file))

  # Update again
  update_checksum("dataset1", temp_file, checksums_file)

  # Fourth check - unchanged again
  expect_false(detect_data_changes(temp_file, "dataset1", checksums_file))
})
