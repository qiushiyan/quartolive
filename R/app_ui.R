#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    golem_add_external_resources(),
    fluidPage(
      fluidRow(
        h1("quartolive"),
        actionButton("render", "Render"),
      ),
      col_6(
        div(id = "app"),
      ),
      col_6(
        uiOutput("report")
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "quartolive"
    ),
    tags$title("Quarto editor in Shiny"),
    tags$link(rel = "stylesheet", href = "./www/app.css", type = "text/css"),
    HTML('<script defer src="./www/index.js"></script>')
  )
}
