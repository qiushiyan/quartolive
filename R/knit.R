knit <- function(code, input_file, ...) {
  tryCatch(
    {
      code <- unlist(strsplit(code, "\n"))
      quarto_data <- partition_input(code)
      header <- parse_front_matter(quarto_data$front_matter)
      body <- quarto_data$body

      if (!is_self_contained(header)) {
        header <- merge(
          header,
          list(format = list(html = list("self-contained" = TRUE)))
        )
      } else if (length(header) == 0) {
        header <- list(format = list(html = list("self-contained" = TRUE)))
      } else if (!has_format(header)) {
        header[["format"]] <- list(html = list("self-contained" = TRUE))
      }

      combine_write(header, body, input_file)
      quarto::quarto_render(input = input_file, ...)
    },
    error = function(cnd) {
      if (!is.null(cnd$stderr)) {
        structure(cnd$stderr, class = "try-error")
      } else {
        structure(cnd$message, class = "try-error")
      }
    }
  )
}
