#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom future plan
#' @noRd
app_server <- function(input, output, session) {
  plan("multicore")

  rv <- reactiveValues(
    error = NULL,
    quarto_code = NULL,
    output_paths = NULL
  )

  mod_editor_server("editor", rv)
  mod_preview_server("preview", rv)
  mod_format_server("format")

  observeEvent(rv$error, {
    if (!is.null(rv$error)) {
      showModal(modal(
        title = "Quarto failed rendering with error",
        rv$error
      ))
    }
  })
}
