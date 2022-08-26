#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  observeEvent(input$render, {
    session$sendCustomMessage("render", list())
  })


  observeEvent(input$quarto_code, {
    input_file <- tempfile(fileext = ".qmd")

    code <- unlist(strsplit(input$quarto_code, "\n"))
    quarto_data <- rmarkdown:::partition_yaml_front_matter(code)
    header <- rmarkdown:::parse_yaml_front_matter(quarto_data$front_matter)
    body <- quarto_data$body

    use_html <- !is.null(header[["format"]][["html"]])
    not_self_contained <- is.null(header[["format"]][["html"]][["self-contained"]])

    if (is.null(header[["format"]]) || (not_self_contained)) {
      header <- merge(
        header,
        list(format = list(html = list("self-contained" = TRUE)))
      )
    }

    header <- ymlthis::use_rmarkdown(
      ymlthis::as_yml(header),
      path = input_file,
      body = body,
      quiet = TRUE,
      overwrite = TRUE,
      open_doc = FALSE
    )

    quarto::quarto_render(
      input = input_file,
      quiet = TRUE
    )

    output_file <- xfun::with_ext(input_file, "html")
    print(output_file)
    fs::file_copy(output_file, app_sys("app/www/index.html"), overwrite = TRUE)
  })

  output$report <- renderUI({
    input$quarto_code
    tagList(
      tags$iframe(src = "./www/index.html")
    )
  })
}
