#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom future plan
#' @noRd
app_server <- function(input, output, session) {
  plan("multisession")

  rv <- reactiveValues(
    error = NULL,
    quarto_code = NULL,
    output_paths = NULL,
    output_exts = NULL,
    title = NULL,
    notice = NULL
  )

  mod_editor_server("editor")
  mod_preview_server("preview", rv)
  mod_control_server("control", rv)
  mod_format_server("format")

  observeEvent(rv$error, {
    if (!is.null(rv$error)) {
      golem::invoke_js("error", list())
      showModal(modal(
        title = "Quarto failed rendering with error",
        rv$error
      ))
    }
  })

  observeEvent(rv$notice, {
    if (!is.null(rv$notice)) {
      notify(rv$notice, duration = 5, closeButton = TRUE)
    }
  })
}
