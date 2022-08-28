#' format Server Functions
#'
#' @noRd
mod_format_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    observeEvent(input$quarto_code_raw, {
      quarto_code_formatted <- format_qmd(input$quarto_code_raw)
      golem::invoke_js("update_code", list(code = quarto_code_formatted))
    })
  })
}

## To be copied in the UI
# mod_format_ui("format_1")

## To be copied in the server
# mod_format_server("format_1")
