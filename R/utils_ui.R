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


spinner <- function() {
  div(
    class = "spinner",
    div(),
    div(),
    div(),
    div()
  )
}
