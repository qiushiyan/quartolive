get_output_exts <- function(header) {
  empty_header <- length(header) == 0
  if (empty_header || !has_format(header)) {
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


get_output_file <- function(input_file, ext) {
  with_ext(input_file, ext)
}
