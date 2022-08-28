test_that("knit with no metadata", {
  f <- create_qmd()
  knit("# heading 1", )
})
