format_qmd <- function(raw) {
  f <- create_qmd()
  xfun::write_utf8(raw, f)
  utils::capture.output(styler::style_file(f))

  paste(xfun::read_utf8(f), collapse = "\n")
}
