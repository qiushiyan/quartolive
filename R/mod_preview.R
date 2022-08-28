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
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    rv <- reactiveValues(error = NULL)

    observeEvent(input$quarto_code, {
      print(input$quarto_code)
      input_file <- tempfile(fileext = ".qmd")
      res <- knit(input$quarto_code, input_file = input_file)
      if (inherits(res, "try-error")) {
        rv$error <- res
      } else {
        rv$error <- NULL
        output_file <- xfun::with_ext(input_file, "html")
        fs::file_copy(output_file, app_sys("app/www/index.html"), overwrite = TRUE)
        golem::invoke_js("reload_preview", list(prefix = "preview"))
      }
    })

    output$out <- renderUI({
      if (!is.null(rv$error)) {
        p(rv$error)
      } else {
        tags$iframe(
          src = "./www/index.html",
          id = ns("preview_frame")
        )
      }
    })
  })
}

## To be copied in the UI
# mod_preview_ui("preview_1")

## To be copied in the server
# mod_preview_server("preview_1")
