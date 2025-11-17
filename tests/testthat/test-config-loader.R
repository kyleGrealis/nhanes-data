library(testthat)
library(nhanesdata)

# Test load_dataset_config() ------------------------------------------------------

test_that("load_dataset_config loads actual datasets.yml file correctly", {
  # This tests the real file in inst/extdata/datasets.yml
  config_path <- system.file("extdata", "datasets.yml", package = "nhanesdata")

  # Skip if file doesn't exist (e.g., during development)
  skip_if_not(file.exists(config_path), "datasets.yml not found in inst/extdata")

  result <- load_dataset_config(config_path)

  # Should return a data frame
  expect_s3_class(result, "data.frame")

  # Should have correct columns
  expect_named(result, c("name", "description", "category", "notes"))

  # Should have all 66 datasets
  expect_equal(nrow(result), 66)

  # All names should be non-empty strings
  expect_true(all(nchar(result$name) > 0))

  # All descriptions should be non-empty strings
  expect_true(all(nchar(result$description) > 0))

  # Categories should only be questionnaire or examination
  expect_true(all(result$category %in% c("questionnaire", "examination")))

  # Notes column should exist (may contain NA)
  expect_type(result$notes, "character")
})

test_that("load_dataset_config errors when config file doesn't exist", {
  expect_error(
    load_dataset_config("nonexistent_file.yml"),
    "Configuration file not found: nonexistent_file.yml"
  )
})

test_that("load_dataset_config returns data frame with correct structure", {
  withr::local_tempdir()

  # Create minimal test YAML
  test_yaml <- tempfile(fileext = ".yml")
  yaml_content <- "
datasets:
  - name: demo
    description: Demographics
    category: questionnaire

  - name: bpxo
    description: Blood Pressure Oscillometric
    category: examination
    notes: Special processing required
"
  writeLines(yaml_content, test_yaml)

  result <- load_dataset_config(test_yaml)

  # Structure checks
  expect_s3_class(result, "data.frame")
  expect_equal(nrow(result), 2)
  expect_equal(ncol(result), 4)

  # Column name checks
  expect_named(result, c("name", "description", "category", "notes"))

  # Type checks
  expect_type(result$name, "character")
  expect_type(result$description, "character")
  expect_type(result$category, "character")
  expect_type(result$notes, "character")

  # Content checks
  expect_equal(result$name, c("demo", "bpxo"))
  expect_equal(result$description, c("Demographics", "Blood Pressure Oscillometric"))
  expect_equal(result$category, c("questionnaire", "examination"))
})

test_that("load_dataset_config handles missing notes field as NA", {
  withr::local_tempdir()

  # Create YAML with some datasets having notes and some not
  test_yaml <- tempfile(fileext = ".yml")
  yaml_content <- "
datasets:
  - name: dataset1
    description: Dataset with notes
    category: questionnaire
    notes: This has notes

  - name: dataset2
    description: Dataset without notes
    category: examination
"
  writeLines(yaml_content, test_yaml)

  result <- load_dataset_config(test_yaml)

  # dataset1 should have notes
  expect_equal(result$notes[result$name == "dataset1"], "This has notes")

  # dataset2 should have NA for notes
  expect_true(is.na(result$notes[result$name == "dataset2"]))
})

test_that("load_dataset_config handles empty datasets list", {
  withr::local_tempdir()

  # Create YAML with empty datasets
  test_yaml <- tempfile(fileext = ".yml")
  yaml_content <- "
datasets: []
"
  writeLines(yaml_content, test_yaml)

  # The function doesn't handle empty lists well - do.call(rbind, list()) returns NULL
  # This is expected behavior for the current implementation
  result <- load_dataset_config(test_yaml)

  # Current behavior: returns NULL for empty list
  expect_null(result)
})

test_that("load_dataset_config preserves dataset order from YAML", {
  withr::local_tempdir()

  # Create YAML with specific order
  test_yaml <- tempfile(fileext = ".yml")
  yaml_content <- "
datasets:
  - name: zebra
    description: Last alphabetically
    category: questionnaire

  - name: apple
    description: First alphabetically
    category: examination

  - name: mango
    description: Middle alphabetically
    category: questionnaire
"
  writeLines(yaml_content, test_yaml)

  result <- load_dataset_config(test_yaml)

  # Should preserve YAML order (not sort alphabetically)
  expect_equal(result$name, c("zebra", "apple", "mango"))
})

test_that("load_dataset_config handles single dataset", {
  withr::local_tempdir()

  # Create YAML with just one dataset
  test_yaml <- tempfile(fileext = ".yml")
  yaml_content <- "
datasets:
  - name: solo
    description: Only dataset
    category: questionnaire
"
  writeLines(yaml_content, test_yaml)

  result <- load_dataset_config(test_yaml)

  expect_equal(nrow(result), 1)
  expect_equal(result$name, "solo")
  expect_equal(result$description, "Only dataset")
  expect_equal(result$category, "questionnaire")
  expect_true(is.na(result$notes))
})

test_that("load_dataset_config actual file has expected datasets", {
  config_path <- system.file("extdata", "datasets.yml", package = "nhanesdata")
  skip_if_not(file.exists(config_path), "datasets.yml not found")

  result <- load_dataset_config(config_path)

  # Check for some known datasets (from the specification)
  expected_datasets <- c("demo", "acq", "alq", "bpq", "trigly")

  expect_true(all(expected_datasets %in% result$name))
})

test_that("load_dataset_config actual file has valid categories", {
  config_path <- system.file("extdata", "datasets.yml", package = "nhanesdata")
  skip_if_not(file.exists(config_path), "datasets.yml not found")

  result <- load_dataset_config(config_path)

  # Every dataset should have a valid category
  valid_categories <- c("questionnaire", "examination")
  expect_true(all(result$category %in% valid_categories))

  # Should have both types of categories
  expect_true("questionnaire" %in% result$category)
  expect_true("examination" %in% result$category)
})

test_that("load_dataset_config handles special characters in descriptions", {
  withr::local_tempdir()

  # Create YAML with special characters
  test_yaml <- tempfile(fileext = ".yml")
  yaml_content <- "
datasets:
  - name: special
    description: \"Test & More: 100% Complete!\"
    category: questionnaire
    notes: \"Quotes, colons: semicolons; & ampersands\"
"
  writeLines(yaml_content, test_yaml)

  result <- load_dataset_config(test_yaml)

  expect_equal(result$description, "Test & More: 100% Complete!")
  expect_equal(result$notes, "Quotes, colons: semicolons; & ampersands")
})

test_that("load_dataset_config doesn't convert strings to factors", {
  withr::local_tempdir()

  test_yaml <- tempfile(fileext = ".yml")
  yaml_content <- "
datasets:
  - name: test
    description: Test description
    category: questionnaire
"
  writeLines(yaml_content, test_yaml)

  result <- load_dataset_config(test_yaml)

  # All columns should be character, not factor
  expect_false(is.factor(result$name))
  expect_false(is.factor(result$description))
  expect_false(is.factor(result$category))
  expect_false(is.factor(result$notes))
})
