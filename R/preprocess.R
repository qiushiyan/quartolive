#' from rmarkdown:::partition_yaml_front_matter
#' @return
#' A list of two fields
#'  - front_matter: character vector of yaml metadata, typically starts and ends
#'   with '---'
#'  - body: character vector
partition_input <- function(input_lines) {
  validate_front_matter <- function(delimiters) {
    if (length(delimiters) >= 2 && (delimiters[2] - delimiters[1] >
      1) && grepl("^---\\s*$", input_lines[delimiters[1]])) {
      if (delimiters[1] == 1) {
        TRUE
      } else {
        all(grepl(
          "^\\s*(<!-- rnb-\\w*-(begin|end) -->)?\\s*$",
          input_lines[1:delimiters[1] - 1]
        ))
      }
    } else {
      FALSE
    }
  }
  delimiters <- grep("^(---|\\.\\.\\.)\\s*$", input_lines)
  if (validate_front_matter(delimiters)) {
    front_matter <- input_lines[(delimiters[1]):(delimiters[2])]
    input_body <- c()
    if (delimiters[1] > 1) {
      input_body <- c(input_body, input_lines[1:delimiters[1] -
        1])
    }
    if (delimiters[2] < length(input_lines)) {
      input_body <- c(input_body, input_lines[-(1:delimiters[2])])
    }
    list(front_matter = front_matter, body = input_body)
  } else {
    list(front_matter = NULL, body = input_lines)
  }
}

validate_front_matter <- function(front_matter) {
  front_matter <- sub("\\s+$", "", front_matter)
  if (grepl(":$", front_matter)) {
    FALSE
  } else {
    TRUE
  }
}


# part of rmarkdown:::parse_yaml_front_matter
parse_front_matter <- function(front_matter) {
  if (!is.null(front_matter)) {
    if (length(front_matter) > 2) {
      front_matter <- front_matter[2:(length(front_matter) - 1)]
      front_matter <- paste(front_matter, collapse = "\n")
      if (!validate_front_matter(front_matter)) {
        return(structure(front_matter, class = "try-error"))
      }
      parsed_yaml <- yaml_load(front_matter)
      if (is.list(parsed_yaml)) {
        parsed_yaml
      } else {
        list()
      }
    } else {
      list()
    }
  } else {
    list()
  }
}


# revised from ymlthis:::capture_yml
front_matter_to_text <- function(front_matter) {
  utils::capture.output({
    cat("---\n")
    # only writes yaml when front_matter is not list()
    if (length(front_matter) != 0) {
      cat(yaml::as.yaml(front_matter, handlers = yml_handlers(), column.major = FALSE))
    }
    cat("---\n")
  })
}

# revised from ymlthis::use_rmarkdown
combine_write <- function(front_matter, body, path) {
  front_matter_text <- front_matter_to_text(front_matter)
  full_text <- c(front_matter_text, body)
  if (fs::file_exists(path)) {
    fs::file_delete(path)
  }
  usethis::write_over(path, full_text, quiet = TRUE)

  invisible(path)
}

has_prop <- function(x, prop) {
  prop %in% names(x)
}

has_format <- function(header) {
  has_prop(header, "format")
}

is_format <- function(header, output_format) {
  has_prop(header[["format"]], output_format)
}

is_embed_resources <- function(header, output_format) {
  if (length(header) == 0) {
    return(FALSE)
  }

  if (has_prop(header, "embed-resources") || has_prop(header, "self-contained")) {
    return(TRUE)
  }

  if (!is.list(header[["format"]])) {
    return(FALSE)
  }

  format_spec <- header[["format"]][[output_format]]


  is.list(format_spec) && grepl("self-contained|embed-resources", names(format_spec))
}

is_missing_dash <- function(code) {
  any(grepl("^-{1,2}$", code))
}

get_title <- function(header, body) {
  if (has_prop(header, "title")) {
    return(header$title)
  }

  first_levels <- grep("^#\\s*\\w+", body, value = TRUE)
  if (length(first_levels) == 1L) {
    title <- sub("#\\s*", "", first_levels)
  } else {
    title <- "quartolive"
  }

  title
}
