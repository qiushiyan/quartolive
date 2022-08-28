# recursively merge two lists
merge <- function(x, y) {
  stopifnot(is.list(x) && is.list(y))

  if (length(x) == 0) {
    return(y)
  }

  for (i in names(x)) {
    if (i %in% names(y)) {
      if (is.list(x[[i]]) && is.list(y[[i]])) {
        x[[i]] <- merge(x[[i]], y[[i]])
      } else {
        x[[i]] <- y[[i]]
      }
    }
  }

  for (i in names(y)) {
    if (!i %in% names(x)) {
      x[[i]] <- y[[i]]
    }
  }

  x
}

yaml_load <- function(...) {
  yaml::yaml.load(..., eval.expr = TRUE)
}

# from ymlthis::yml_handlers
yml_handlers <- function() {
  list(
    `NULL` = function(x) yml_verbatim("null"), glue = function(x) as.character(x),
    Date = function(x) as.character(x), logical = function(x) {
      yml_verbatim(ifelse(x, "true", "false"))
    }
  )
}

yml_verbatim <- function(x) {
  structure(x, class = "verbatim")
}
c

create_qmd <- function() {
  tempfile(fileext = ".qmd")
}

`%||%` <- function(x, y) {
  if (is.null(x)) {
    y
  } else {
    x
  }
}

is_null <- function(x, ...) {
  purrr::map_lgl(x, is.null, ...)
}

# copied from xfun::with_ext
with_ext <- function(x, ext) {
  reg_ext <- "([.](([-+!_#[:alnum:]]+|tar[.](gz|bz2|xz)|nb[.]html)[~#]?))$"
  if (anyNA(ext)) {
    stop("NA is not allowed in 'ext'")
  }
  n1 <- length(x)
  n2 <- length(ext)
  if (n1 * n2 == 0) {
    return(x)
  }
  i <- !grepl("^[.]", ext) & ext != ""
  ext[i] <- paste0(".", ext[i])
  if (all(ext == "")) {
    ext <- ""
  }
  r <- sub("[$]$", "?$", reg_ext)
  if (length(ext) == 1) {
    return(sub(r, ext, x))
  }
  if (n1 > 1 && n1 != n2) {
    stop("'ext' must be of the same length as 'x'")
  }
  mapply(sub, r, ext, x, USE.NAMES = FALSE)
}

notify <- function(msg, id = NULL, type = "message", duration = NULL, closeButton = FALSE, ...) {
  showNotification(msg, id = id, duration = duration, closeButton = closeButton, type = type, ...)
}

preview_frame <- function(output_format) {
  tags$iframe(
    src = with_ext("./www/output", output_format),
    class = "preview-frame"
  )
}
