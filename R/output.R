get_output_formats <- function(header) {
  empty_header <- length(header) == 0
  no_format <- !"format" %in% names(header)
  if (empty_header || no_format) {
    return(c("html" = "html"))
  }

  all_formats <- if (is.list(header[["format"]])) names(header[["format"]]) else header[["format"]]
  sapply(all_formats, output_format_to_ext)
}

output_format_to_ext <- function(output_format) {
  switch(output_format,
    "html" = "html",
    "pdf" = "pdf",
    "revealjs" = "html",
    NULL
  )
}


get_output_file <- function(input_file, output_format) {
  if (output_format %in% c("html", "pdf")) {
    with_ext(input_file, output_format)
  } else {
    xfun::with_ext(input_file, output_format)
  }
}