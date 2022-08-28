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
mod_preview_server <- function(id) {
  w <- waiter::Waiter$new(id = "preview-pane")

  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    rv <- reactiveValues(error = NULL, output_formats = NULL)

    observeEvent(input$quarto_code, {
      w$show()
      on.exit(w$hide())

      code <- unlist(strsplit(input$quarto_code, "\n"))
      quarto_data <- partition_input(code)
      header <- parse_front_matter(quarto_data$front_matter)
      body <- quarto_data$body

      # a named vector where names are quarto output formats, values are file exts
      print(header)
      output_formats <- get_output_formats(header)
      formats_unsupported <- is_null(output_formats)
      if (!all(formats_unsupported)) {
        output_formats <- output_formats[!formats_unsupported]
        if (length(output_formats) == 1) {
          # only one output format
          rv$output_formats <- output_formats[1L]
          msg <- knit_one(header, body, output_format = rv$output_formats)
          if (!is.null(msg)) {
            rv$error <- msg
          } else {
            rv$error <- NULL
          }
        } else {
          # multiple formats
          rv$output_formats <- output_formats
          print(output_formats)
          msgs <- furrr::future_map(
            output_formats,
            ~ knit_one(header, body, .)
          ) |> unlist()

          empty_msgs <- is_null(msgs)
          if (!all(empty_msgs)) {
            rv$error <- paste(msgs[!empty_msgs], collapse = "\n")
          } else {
            rv$error <- NULL
          }
        }
      } else {
        rv$error <- "no supported format found, see https://quarto.org/docs/output-formats/all-formats.html"
      }

      golem::invoke_js("reload_preview", list())
    })

    observeEvent(rv$error, {
      if (!is.null(rv$error)) {
        notify(rv$error, type = "error", duration = 5, closeButton = TRUE)
      }
    })

    output$out <- renderUI({
      if (length(rv$output_formats) == 1) {
        preview_frame(rv$output_formats)
      } else {
        do.call(
          tabsetPanel,
          purrr::map(
            unname(rv$output_formats),
            ~ tabPanel(., preview_frame(.))
          )
        )
      }
    })
  })
}

## To be copied in the UI
# mod_preview_ui("preview_1")

## To be copied in the server
# mod_preview_server("preview_1")
