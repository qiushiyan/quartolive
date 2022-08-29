invalid_yaml_msg <- paste0(
  "Invalid YAML metadata, a field ends with ':'. ",
  "Fix it and knit again"
)

no_supported_msg <- function(formats = "") {
  if (length(formats) == 1) {
    msg <- sprintf("%s is not a supported format.", formats)
  } else {
    msg <- sprintf("No supported formats found in %s.", paste(formats, collapse = ", "))
  }
  paste0(msg, " See https://quarto.org/docs/output-formats/all-formats.html for all supported formats.")
}
