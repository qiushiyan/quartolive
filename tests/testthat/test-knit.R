test_that("knit with no metadata", {
  result <- knit("# heading 1", body = "", create_qmd())
  result
})

test_that("format to file ext conversion", {
  expect_equal(
    get_output_exts(list(toc = TRUE)),
    data.frame(output_format = "html", output_ext = "html")
  )

  header <- list(format = list(
    html = "default",
    gfm = "default",
    pdf = list(toc = TRUE),
    revealjs = "default"
  ))

  exts <- get_output_exts(header)
  rownames(exts) <- NULL

  expect_equal(
    exts,
    data.frame(
      output_format = c("html", "gfm", "pdf", "revealjs"),
      output_ext = c("html", "md", "pdf", "html")
    )
  )
})
