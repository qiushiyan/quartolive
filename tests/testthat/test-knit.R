test_that("knit with no metadata", {
  f <- tempfile(fileext = "qmd")
  knit("# heading 1", )
})
