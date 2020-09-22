#' @importFrom shiny insertUI
#' @export withConsoleRedirect
withConsoleRedirect <- function(containerId, expr) {
  message('Running Code')
  print('Running Doce')
  # Change type="output" to type="message" to catch stderr
  # (messages, warnings, and errors) instead of stdout.
  txt <- capture.output(results <- expr, type = "output")
  if (length(txt) > 0) {
    insertUI(paste0("#", containerId), where = "beforeEnd",
             ui = paste0(txt, "\n", collapse = "")
    )
  }
  results
}
