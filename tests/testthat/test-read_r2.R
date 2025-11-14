test_that("read_r2 can read a parquet file from the web", {
  # This test uses httptest2 to mock the web request.
  # It looks for a mock file in tests/testthat/fixtures/
  # The path in the fixtures directory should match the URL path.
  
  httptest2::with_mock_dir("fixtures", {
    # Debugging: list files to see what's available
    print(list.files("."))
    print(list.files("./nhanes.kylegrealis.com"))
  
    # Call the function that makes the HTTP request
    result <- read_r2("test-data", type = "parquet")
    
    # Check the results
    expect_s3_class(result, "data.frame")
    expect_equal(nrow(result), 5)
    expect_equal(names(result), c("id", "value"))
  })
})