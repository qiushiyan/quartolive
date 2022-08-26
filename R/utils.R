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
