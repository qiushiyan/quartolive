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
      theme = bslib::bs_theme(version = 5),
      h1("quartolive"),
      div(
        col_6(
          mod_editor_ui("editor"),
          id = "editor-pane"
        ),
        col_6(
          mod_preview_ui("preview"),
          id = "preview-pane"
        ),
        class = "split"
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
    HTML('<script defer src="www/index.js"></script>'),
    waiter::use_waiter()
  )
}
