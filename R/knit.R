knit <- function(header, body, input, output_format, ...) {
  tryCatch(
    {
      if (is_html(header) && !is_self_contained(header)) {
        header <- merge(
          header,
          list(format = list(html = list("self-contained" = TRUE)))
        )
      } else if (length(header) == 0) {
        header <- list(format = list(html = list("self-contained" = TRUE)))
      } else if (!has_format(header)) {
        header[["format"]] <- list(html = list("self-contained" = TRUE))
      }

      combine_write(header, body, input)
      quarto::quarto_render(input = input, output_format = output_format, ...)
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

knit_one <- function(header, body, output_format, ...) {
  input_file <- create_qmd()
  msg <- knit(header, body, input = input_file, output_format = output_format, ...)
  if (inherits(msg, "try-error")) {
    return(msg)
  } else {
    output_file <- get_output_file(input_file, output_format)
    output_file_copy <- with_ext(app_sys("app/www/output"), output_format)

    if (!fs::file_exists(output_file_copy)) {
      fs::file_create(output_file_copy)
    }

    fs::file_copy(output_file, output_file_copy, overwrite = TRUE)
  }

  invisible(NULL)
}
