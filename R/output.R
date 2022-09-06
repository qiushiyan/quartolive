formats_df <- read.csv(app_sys("formats.csv"))

get_output_exts <- function(header) {
  empty_header <- length(header) == 0
  if (empty_header || !has_format(header)) {
    return(data.frame(output_format = "html", output_ext = "html"))
  }

  formats <- if (is.list(header[["format"]])) {
    names(header[["format"]])
  } else {
    header[["format"]]
  }

  exts_df <- formats_df[formats_df$output_format %in% formats, , drop = FALSE]
  exts_df[match(formats, exts_df$output_format), ]
}


get_output_file <- function(input_file, ext) {
  with_ext(input_file, ext)
}
