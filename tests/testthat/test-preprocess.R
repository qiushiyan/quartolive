test_that("is_embed_resources works", {
  expect_false(is_embed_resources(list(), "html"))

  expect_false(is_embed_resources(list(format = "html"), "html"))

  expect_false(
    is_embed_resources(
      list(format = list(html = "default")),
      "html"
    )
  )

  expect_true(
    is_embed_resources(
      list(format = list(html = list("self-contained" = TRUE))),
      "html"
    )
  )

  expect_false(
    is_embed_resources(
      list(format = list(html = list(toc = TRUE))),
      "html"
    )
  )

  expect_true(
    is_embed_resources(
      list("embed-resources" = TRUE, format = "pdf"),
      "html"
    )
  )
})
