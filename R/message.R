invalid_yaml_msg <- function(header) {
  HTML(paste0(
    "Invalid YAML metadata, A yaml field end with ':'.",
    "<br/>",
    "Fix it and knit again."
  ))
}

not_supported_msg <- function(output_format) {
  if (output_format %in% c("docx", "epub")) {
    msg <- paste0(
      "docx is not currently supported for preview, ",
      "you can download the output by clicking the download button."
    )
  } else if (length(output_format) == 1) {
    msg <- sprintf("%s is not a supported format.", output_format)
  } else {
    msg <- sprintf("No supported formats found in %s.", paste(output_format, collapse = ", "))
  }

  href <- "https://quarto.org/docs/output-formats/all-formats.html"
  HTML(paste0(
    msg,
    sprintf("<br/>See <a href='%s'>here</a> for all quarto's supported formats.", href)
  ))
}

knit_error_msg <- function(text) {
  text <- fansi::to_html(text, warn = FALSE)
  text <- gsub("\\n", "<br/>", text)
  if (length(text) == 1) {
    HTML(text)
  } else {
    output_formats <- names(text)
    errors <- unname(text)
    do.call(
      tabsetPanel,
      purrr::map2(output_formats, errors, ~ tabPanel(.x, HTML(.y)))
    )
  }
}

no_format_msg <- "No format found in YAML header, using HTML as the default."

missing_dash_msg <- "Incomplete --- detected in YAML header, did you miss dashes?"
