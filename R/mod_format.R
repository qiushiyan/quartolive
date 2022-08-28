#' format Server Functions
#'
#' @noRd
mod_format_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    observeEvent(input$quarto_code_raw, {
      id <- notify("formatting Quarto document ...")
      on.exit(removeNotification(id), add = TRUE)

      quarto_code_formatted <- format_qmd(input$quarto_code_raw)
      golem::invoke_js("update_code", list(code = quarto_code_formatted))
    })
  })
}
