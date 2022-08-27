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

yml_verbatim <- function (x)
{
  structure(x, class = "verbatim")
}

