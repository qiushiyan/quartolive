#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  observeEvent(input$knit, {
    golem::invoke_js("knit", list())
  })

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
      golem::invoke_js("refresh_preview", list())
    }
  })

  output$out <- renderUI({
    if (!is.null(rv$error)) {
      p(rv$error)
    } else {
      tags$iframe(
        src = "./www/index.html",
        id = "preview_frame"
      )
    }
  })

}
