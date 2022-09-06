#' preview UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_preview_ui <- function(id) {
  ns <- NS(id)
  tagList(
    uiOutput(ns("out")),
    # div(spinner(), id = "overlay"),
  )
}

#' preview Server Functions
#'
#' @noRd
mod_preview_server <- function(id, global_rv) {
  gif <- paste0(
    "https://media1.tenor.com/images",
    "/cb27704982766b4f02691ea975d9a259/tenor.gif?itemid=11365139"
  )
  loading_screen <- tagList(
    h4("Preprocessing document ...", style = "color:gray;"),
    img(src = gif, height = "200px")
  )
  w <- waiter::Waiter$new(
    id = "preview-pane",
    html = loading_screen
  )

  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    observeEvent(input$quarto_code, {
      w$show()
      on.exit(w$hide())

      code <- unlist(strsplit(input$quarto_code, "\n"))

      if (is_missing_dash(code)) {
        notify(missing_dash_msg)
      }

      quarto_data <- partition_input(code)
      header <- parse_front_matter(quarto_data$front_matter)
      title <- get_title(header, quarto_data$body)
      if (!has_prop(header, "format")) {
        notify(no_format_msg)
      }

      if (inherits(header, "try-error")) {
        global_rv$error <- invalid_yaml_msg(header)
      } else {
        body <- quarto_data$body
        # a named vector where names are output formats, values are file exts
        exts_df <- get_output_exts(header)
        output_exts <- exts_df$output_ext
        output_formats <- exts_df$output_format

        supported_exts <- !is_null(output_exts)
        if (any(supported_exts)) {
          output_exts <- output_exts[supported_exts]
          output_formats <- output_formats[supported_exts]
          update_loading_screen(w, "Start rendering ...")
          if (length(output_exts) == 1) {
            # only one output format
            results <- knit_one(header, body, output_formats, output_exts)
            if (results$error) {
              global_rv$error <- knit_error_msg(results[["res"]])
            } else {
              global_rv$error <- NULL
              global_rv$output_paths <- results[["res"]]
              global_rv$output_exts <- output_exts
              global_rv$title <- title
            }
          } else {
            # multiple formats
            # res is in the format
            #  list(error = c(TRUE, FALSE), res = c("error message", "output path))
            results <- furrr::future_map2(
              output_formats,
              output_exts,
              ~ knit_one(header, body, output_format = .x, ext = .y)
            ) |>
              purrr::transpose() |>
              purrr::map(unlist)

            error_index <- results[["error"]]
            msgs <- results[["res"]][error_index]
            output_paths <- results[["res"]][!error_index]
            if (length(output_paths) > 0) {
              names(output_paths) <- output_formats[!error_index]
            }
            if (length(msgs) > 0) {
              names(msgs) <- output_formats[error_index]
            }
            if (all(error_index)) {
              global_rv$error <- knit_error_msg(msgs)
            } else {
              global_rv$output_paths <- output_paths
              global_rv$output_exts <- output_exts
              global_rv$title <- title
              if (length(msgs) == 0) {
                global_rv$error <- NULL
              } else {
                global_rv$error <- knit_error_msg(msgs)
              }
            }
          }
          update_loading_screen(w, "Finished rendering!")
        } else {
          global_rv$error <- not_supported_msg(output_formats)
        }

        golem::invoke_js("reload_preview", list())
      }
    })


    output$out <- renderUI({
      if (is.null(global_rv$output_paths)) {
        p("preiview here")
      } else {
        if (length(global_rv$output_paths) == 1) {
          preview_frame(global_rv$output_paths)
        } else {
          titles <- names(global_rv$output_paths)
          output_paths <- unname(global_rv$output_paths)
          do.call(
            tabsetPanel,
            purrr::map2(
              titles,
              output_paths,
              ~ tabPanel(.x, preview_frame(.y))
            )
          )
        }
      }
    })
  })
}

## To be copied in the UI
# mod_preview_ui("preview_1")

## To be copied in the server
# mod_preview_server("preview_1")
