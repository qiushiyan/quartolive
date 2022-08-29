knit <- function(header, body, input, output_format, ext, ...) {
  tryCatch(
    {
      if (ext == "html") {
        if (!is_embed_resources(header, output_format)) {
          header[["embed-resources"]] <- TRUE
        }
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

after_knit <- function(input_file, ext) {
  if (ext %in% c("html", "pdf")) {
    output_file <- get_output_file(input_file, ext)

    output_base_name <- with_ext(basename(output_file), ext)
    output_file_copy <- fs::path_join(c(app_sys("app/www"), output_base_name))

    if (!fs::file_exists(output_file_copy)) {
      fs::file_create(output_file_copy)
    }

    fs::file_copy(output_file, output_file_copy, overwrite = TRUE)

    paste0("./www/", output_base_name)
  } else {
    # postprocess other formats
  }
}

knit_one <- function(header, body, output_format, ext, ...) {
  input_file <- create_qmd()
  msg <- knit(header, body, input = input_file, output_format = output_format, ext = ext, ...)
  if (inherits(msg, "try-error")) {
    return(list(error = TRUE, res = msg))
  }
  output_path <- after_knit(input_file, ext)
  list(error = FALSE, res = output_path)
}
