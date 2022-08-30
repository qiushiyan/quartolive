#' editor UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_editor_ui <- function(id) {
  ns <- NS(id)
  tagList(
    actionButton(ns("knit"), "Knit"),
    div(id = "quarto-editor")
  )
}

#' editor Server Functions
#'
#' @noRd
mod_editor_server <- function(id, global_rv) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    observeEvent(input$knit, {
      global_rv$error <- NULL
      global_rv$notice <- NULL
      global_rv$quarto_code <- NULL
      golem::invoke_js("knit", list(prefix = "preview"))
    })
  })
}

## To be copied in the UI
# mod_editor_ui("editor_1")

## To be copied in the server
# mod_editor_server("editor_1")
