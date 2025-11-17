library(testthat)
library(nhanesdata)

# Helper function to create labeled data frame
make_labeled_df <- function() {
  df <- data.frame(
    id = 1:5,
    age = c(25, 30, 35, 40, 45),
    gender = c("M", "F", "M", "F", "M"),
    score_baseline = c(10, 20, 30, 40, 50),
    score_followup = c(15, 25, 35, 45, 55)
  )

  # Add labels to columns
  attr(df$id, "label") <- "Participant ID"
  attr(df$age, "label") <- "Age in years"
  attr(df$gender, "label") <- "Gender"
  attr(df$score_baseline, "label") <- "Baseline score"
  attr(df$score_followup, "label") <- "Follow-up score"

  # Add some other attributes too
  attr(df$age, "units") <- "years"
  attr(df$score_baseline, "range") <- c(0, 100)

  return(df)
}

# Test drop_label_kyle() ----------------------------------------------------------

test_that("drop_label_kyle removes labels from single variable", {
  df <- make_labeled_df()

  # Verify label exists before
  expect_equal(attr(df$age, "label"), "Age in years")

  # Remove label
  result <- drop_label_kyle(df, age)

  # Label should be gone
  expect_null(attr(result$age, "label"))

  # Other labels should remain
  expect_equal(attr(result$id, "label"), "Participant ID")
  expect_equal(attr(result$gender, "label"), "Gender")

  # Data values should be preserved
  expect_identical(as.vector(result$age), as.vector(df$age))
})

test_that("drop_label_kyle removes labels from multiple variables", {
  df <- make_labeled_df()

  result <- drop_label_kyle(df, id, age, gender)

  # All specified labels should be removed
  expect_null(attr(result$id, "label"))
  expect_null(attr(result$age, "label"))
  expect_null(attr(result$gender, "label"))

  # Unspecified labels should remain
  expect_equal(attr(result$score_baseline, "label"), "Baseline score")
  expect_equal(attr(result$score_followup, "label"), "Follow-up score")
})

test_that("drop_label_kyle works with starts_with selector", {
  df <- make_labeled_df()

  result <- drop_label_kyle(df, starts_with("score_"))

  # Score labels should be removed
  expect_null(attr(result$score_baseline, "label"))
  expect_null(attr(result$score_followup, "label"))

  # Other labels should remain
  expect_equal(attr(result$id, "label"), "Participant ID")
  expect_equal(attr(result$age, "label"), "Age in years")
})

test_that("drop_label_kyle works with contains selector", {
  df <- make_labeled_df()

  result <- drop_label_kyle(df, contains("score"))

  # Both score columns should lose labels
  expect_null(attr(result$score_baseline, "label"))
  expect_null(attr(result$score_followup, "label"))

  # Other labels preserved
  expect_equal(attr(result$id, "label"), "Participant ID")
})

test_that("drop_label_kyle works with ends_with selector", {
  df <- make_labeled_df()

  result <- drop_label_kyle(df, ends_with("up"))

  # Only followup should lose label
  expect_null(attr(result$score_followup, "label"))

  # Others preserved
  expect_equal(attr(result$score_baseline, "label"), "Baseline score")
  expect_equal(attr(result$age, "label"), "Age in years")
})

test_that("drop_label_kyle works with everything selector", {
  df <- make_labeled_df()

  result <- drop_label_kyle(df, everything())

  # All labels should be removed
  expect_null(attr(result$id, "label"))
  expect_null(attr(result$age, "label"))
  expect_null(attr(result$gender, "label"))
  expect_null(attr(result$score_baseline, "label"))
  expect_null(attr(result$score_followup, "label"))

  # Data values preserved (comparing values, not attributes)
  expect_identical(as.vector(result$id), as.vector(df$id))
  expect_identical(as.vector(result$age), as.vector(df$age))
})

test_that("drop_label_kyle removes ALL attributes, not just labels", {
  df <- make_labeled_df()

  # Verify multiple attributes exist
  expect_equal(attr(df$age, "label"), "Age in years")
  expect_equal(attr(df$age, "units"), "years")
  expect_equal(attr(df$score_baseline, "range"), c(0, 100))

  result <- drop_label_kyle(df, age, score_baseline)

  # ALL attributes should be removed (not just label)
  expect_null(attr(result$age, "label"))
  expect_null(attr(result$age, "units"))
  expect_null(attr(result$score_baseline, "label"))
  expect_null(attr(result$score_baseline, "range"))

  # But data values are preserved (comparing values, not attributes)
  expect_identical(as.vector(result$age), as.vector(df$age))
  expect_identical(as.vector(result$score_baseline), as.vector(df$score_baseline))
})

test_that("drop_label_kyle preserves data values exactly", {
  df <- make_labeled_df()

  result <- drop_label_kyle(df, age, score_baseline)

  # All data should be identical (comparing values, not attributes)
  expect_identical(as.vector(result$id), as.vector(df$id))
  expect_identical(as.vector(result$age), as.vector(df$age))
  expect_identical(as.vector(result$gender), as.vector(df$gender))
  expect_identical(as.vector(result$score_baseline), as.vector(df$score_baseline))
  expect_identical(as.vector(result$score_followup), as.vector(df$score_followup))

  # Data frame structure preserved
  expect_equal(nrow(result), nrow(df))
  expect_equal(ncol(result), ncol(df))
  expect_equal(names(result), names(df))
})

test_that("drop_label_kyle works with data frame that has no labels", {
  df <- data.frame(
    x = 1:5,
    y = 6:10
  )

  # Should not error
  expect_silent(result <- drop_label_kyle(df, x))

  # Should return same data
  expect_equal(result, df)
})

test_that("drop_label_kyle works with mixed labeled and unlabeled columns", {
  df <- data.frame(
    labeled = 1:5,
    unlabeled = 6:10,
    also_labeled = 11:15
  )

  attr(df$labeled, "label") <- "This is labeled"
  attr(df$also_labeled, "label") <- "Also labeled"
  # unlabeled has no label attribute

  result <- drop_label_kyle(df, labeled, unlabeled, also_labeled)

  # All should have no attributes now
  expect_null(attr(result$labeled, "label"))
  expect_null(attr(result$unlabeled, "label"))
  expect_null(attr(result$also_labeled, "label"))
})

test_that("drop_label_kyle returns data frame (not tibble) when given data frame", {
  df <- make_labeled_df()

  result <- drop_label_kyle(df, age)

  expect_true(is.data.frame(result))
  expect_equal(class(result), "data.frame")
})

test_that("drop_label_kyle works with tibble", {
  skip_if_not_installed("tibble")

  df <- tibble::tibble(
    x = 1:5,
    y = 6:10
  )

  attr(df$x, "label") <- "X label"
  attr(df$y, "label") <- "Y label"

  result <- drop_label_kyle(df, x)

  expect_null(attr(result$x, "label"))
  expect_equal(attr(result$y, "label"), "Y label")
})

test_that("drop_label_kyle works with numeric column indices via tidyselect", {
  df <- make_labeled_df()

  # Select columns 2 and 3 (age and gender)
  result <- drop_label_kyle(df, 2, 3)

  expect_null(attr(result$age, "label"))
  expect_null(attr(result$gender, "label"))
  expect_equal(attr(result$id, "label"), "Participant ID")
})

test_that("drop_label_kyle works with where() selector", {
  df <- make_labeled_df()

  # Remove labels from numeric columns
  result <- drop_label_kyle(df, where(is.numeric))

  # Numeric columns should lose labels
  expect_null(attr(result$id, "label"))
  expect_null(attr(result$age, "label"))
  expect_null(attr(result$score_baseline, "label"))
  expect_null(attr(result$score_followup, "label"))

  # Character column should keep label
  expect_equal(attr(result$gender, "label"), "Gender")
})

test_that("drop_label_kyle works with any_of selector", {
  df <- make_labeled_df()

  # Mix of existing and non-existing columns
  result <- drop_label_kyle(df, any_of(c("age", "nonexistent_column", "gender")))

  # Existing columns should lose labels
  expect_null(attr(result$age, "label"))
  expect_null(attr(result$gender, "label"))

  # Other labels preserved
  expect_equal(attr(result$id, "label"), "Participant ID")

  # Should not error even though nonexistent_column doesn't exist
})

test_that("drop_label_kyle works with all_of selector", {
  df <- make_labeled_df()

  columns_to_remove <- c("age", "gender")
  result <- drop_label_kyle(df, all_of(columns_to_remove))

  expect_null(attr(result$age, "label"))
  expect_null(attr(result$gender, "label"))
  expect_equal(attr(result$id, "label"), "Participant ID")
})

test_that("drop_label_kyle handles empty selection gracefully", {
  df <- make_labeled_df()

  # Select nothing
  result <- drop_label_kyle(df, starts_with("nonexistent_prefix"))

  # All labels should remain (nothing was selected)
  expect_equal(attr(result$id, "label"), "Participant ID")
  expect_equal(attr(result$age, "label"), "Age in years")
  expect_equal(attr(result$gender, "label"), "Gender")
})

test_that("drop_label_kyle preserves row names", {
  df <- make_labeled_df()
  rownames(df) <- c("row1", "row2", "row3", "row4", "row5")

  result <- drop_label_kyle(df, age)

  expect_equal(rownames(result), rownames(df))
})

test_that("drop_label_kyle works in pipe chain", {
  df <- make_labeled_df()

  # Should work with magrittr pipe
  result <- df |>
    drop_label_kyle(age, gender) |>
    subset(id <= 3)

  expect_null(attr(result$age, "label"))
  expect_null(attr(result$gender, "label"))
  expect_equal(nrow(result), 3)
})

test_that("drop_label_kyle removes ALL attributes including factor class", {
  df <- data.frame(
    x = 1:5,
    category = factor(c("A", "B", "A", "B", "C"), levels = c("A", "B", "C", "D"))
  )

  attr(df$category, "label") <- "Category label"

  # Verify factor before
  expect_true(is.factor(df$category))

  result <- drop_label_kyle(df, category)

  # Label is removed
  expect_null(attr(result$category, "label"))

  # Note: attributes() <- NULL removes ALL attributes, including class
  # So factor is converted to integer (underlying representation)
  # This is the actual behavior of the function - it removes ALL attributes
  expect_false(is.factor(result$category))
  expect_true(is.integer(result$category))

  # The underlying integer values are preserved
  expect_identical(as.integer(result$category), as.integer(df$category))
})
