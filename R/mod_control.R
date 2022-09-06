#' control UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_control_ui <- function(id) {
  ns <- NS(id)
  tagList(
    actionButton(ns("knit"), "Knit", icon = bs_icon("pencil")),
    downloadButton(ns("download"), "Download", icon = bs_icon("download"))
  )
}

#' control Server Functions
#'
#' @noRd
mod_control_server <- function(id, global_rv) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    observeEvent(input$knit, {
      global_rv$error <- NULL
      global_rv$notice <- NULL
      global_rv$quarto_code <- NULL
      golem::invoke_js("knit", list(prefix = "preview"))
    })

    download_filename <- reactive({
      if (length(global_rv$output_paths) == 1L) {
        paste0(global_rv$title, ".", global_rv$output_exts)
      } else {
        "quartolive.zip"
      }
    })

    output$download <- downloadHandler(
      filename = function() {
        download_filename()
      },
      content = function(file) {
        if (length(global_rv$output_paths) == 1L) {
          print(download_filename())
          print(global_rv$output_exts)
          mode <- if (global_rv$output_exts == "pdf") "wb" else "w"
          download.file(global_rv$output_paths, file)
        } else {
          dir <- tempdir()
          paths <- paste0(dir, "/", basename(global_rv$output_paths))
          output_zip <- tempfile(fileext = ".zip")
          furrr::future_walk2(global_rv$output_paths, paths, function(x, y) {
            mode <- if (tools::file_ext(x) == "pdf") "wb" else "w"
            download.file(x, y, mode = mode)
          })
          system2("zip", args = (paste("-j", output_zip, paths, sep = " ")))
          fs::file_copy(output_zip, file, overwrite = TRUE)
        }
      }
    )
  })
}

## To be copied in the UI
# mod_control_ui("control_1")

## To be copied in the server
# mod_control_server("control_1")
