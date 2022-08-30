#' preview UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_preview_ui <- function(id) {
  ns <- NS(id)
  tagList(
    uiOutput(ns("out"))
  )
}

#' preview Server Functions
#'
#' @noRd
mod_preview_server <- function(id, global_rv) {
  w <- waiter::Waiter$new(id = "preview-pane")

  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    observeEvent(input$quarto_code, {
      print("showing screen")
      w$show()
      on.exit(w$hide())

      code <- unlist(strsplit(input$quarto_code, "\n"))
      quarto_data <- partition_input(code)
      header <- parse_front_matter(quarto_data$front_matter)

      if (!has_prop(header, "format")) {
        notify(no_format_msg)
      }

      if (inherits(header, "try-error")) {
        global_rv$error <- invalid_yaml_msg(header)
      } else {
        body <- quarto_data$body
        # a named vector where names are output formats, values are file exts
        output_exts <- get_output_exts(header)
        output_formats <- names(output_exts)

        supported_exts <- !is_null(output_exts)
        if (any(supported_exts)) {
          output_exts <- output_exts[supported_exts]
          output_formats <- output_formats[supported_exts]
          if (length(output_exts) == 1) {
            # only one output format
            results <- knit_one(header, body, output_formats, output_exts)
            if (results$error) {
              global_rv$error <- knit_error_msg(results[["res"]])
            } else {
              global_rv$error <- NULL
              global_rv$output_paths <- results[["res"]]
            }
          } else {
            # multiple formats
            # res is in the format
            #  list(error = c(TRUE, FALSE), res = c("error message", "output path))
            results <- furrr::future_map2(
              output_formats,
              output_exts,
              ~ knit_one(header, body, output_format = .x, ext = .y)
            ) |>
              purrr::transpose() |>
              purrr::map(unlist)

            error_index <- results[["error"]]
            msgs <- results[["res"]][error_index]
            output_paths <- results[["res"]][!error_index]
            if (length(output_paths) > 0) {
              names(output_paths) <- output_formats[!error_index]
            }
            if (length(msgs) > 0) {
              names(msgs) <- output_formats[error_index]
            }
            if (all(error_index)) {
              global_rv$error <- knit_error_msg(msgs)
            } else {
              global_rv$output_paths <- output_paths
              if (length(msgs) == 0) {
                global_rv$error <- NULL
              } else {
                global_rv$error <- knit_error_msg(msgs)
              }
            }
          }
        } else {
          global_rv$error <- no_supported_msg(names(output_exts))
        }

        golem::invoke_js("reload_preview", list())
      }
    })


    output$out <- renderUI({
      if (is.null(global_rv$output_paths)) {
        p("preview here")
      } else {
        if (length(global_rv$output_paths) == 1) {
          preview_frame(global_rv$output_paths)
        } else {
          titles <- names(global_rv$output_paths)
          output_paths <- unname(global_rv$output_paths)
          do.call(
            tabsetPanel,
            purrr::map2(
              titles,
              output_paths,
              ~ tabPanel(.x, preview_frame(.y))
            )
          )
        }
      }
    })
  })
}

## To be copied in the UI
# mod_preview_ui("preview_1")

## To be copied in the server
# mod_preview_server("preview_1")
