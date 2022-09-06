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

test_that("get_title() extracts title from parsed header and body", {
  body1 <- c("some line", "# first", "## second")
  body2 <- c("# first", "# second")

  expect_identical(
    get_title(list(title = "my title"), body1),
    "my title"
  )

  expect_identical(
    get_title(list(), body1),
    "first"
  )

  expect_identical(
    get_title(list(), body2),
    "quartolive"
  )
})
