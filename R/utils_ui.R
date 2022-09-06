notify <- function(msg, id = NULL, type = "message", duration = 5, closeButton = TRUE, ...) {
  showNotification(msg, id = id, duration = duration, closeButton = closeButton, type = type, ...)
}

preview_frame <- function(output_path) {
  tags$iframe(
    src = output_path,
    class = "preview-frame"
  )
}

modal <- function(title, body) {
  modalDialog(
    title = title,
    body,
    footer = tagList(
      modalButton("OK")
    ),
    easyClose = TRUE
  )
}

bs_icon <- function(name) {
  class_ <- paste0("bi bi-", name)
  tags$i(class = class_, `arial-label` = paste0(name, " icon"))
}

spinner <- function() {
  div(
    class = "spinner",
    div(),
    div(),
    div(),
    div()
  )
}

update_loading_screen <- function(w,
                                  text,
                                  gif = paste0(
                                    "https://media1.tenor.com/images",
                                    "/cb27704982766b4f02691ea975d9a259/tenor.gif?itemid=11365139"
                                  )) {
  w$update(
    html = tagList(
      h4(text, style = "color:gray;"),
      img(src = gif, height = "200px")
    )
  )
}
