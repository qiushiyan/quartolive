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

upload <- function(input_file, ext) {
  if (ext %in% c("html", "pdf", "md")) {
    output_file <- get_output_file(input_file, ext)
    result <- s3_upload(output_file)
  } else {
    # postprocess other formats
  }

  result
}

knit_one <- function(header, body, output_format, ext, ...) {
  input_file <- create_qmd()
  knit_result <- knit(header, body, input = input_file, output_format = output_format, ext = ext, ...)
  if (inherits(knit_result, "try-error")) {
    return(list(error = TRUE, res = knit_result))
  }
  upload_result <- upload(input_file, ext)
  if (inherits(upload_result, "try-error")) {
    return(list(error = TRUE, res = upload_result))
  }
  list(error = FALSE, res = upload_result)
}
