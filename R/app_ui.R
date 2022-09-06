#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  theme <- bslib::bs_theme(
    bootswatch = "cerulean",
    base_font = bslib::font_google("Righteous")
  )

  tagList(
    golem_add_external_resources(),
    fluidPage(
      theme = theme,
      h1("quartolive"),
      div(
        mod_control_ui("control"),
        id = "control"
      ),
      div(
        div(
          mod_editor_ui("editor"),
          id = "editor-pane"
        ),
        div(
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
    tags$link(rel = "stylesheet", href = "https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css"),
    HTML('<script defer src="www/index.js"></script>'),
  )
}
