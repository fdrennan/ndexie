#' withConsoleRedirect
#' @param containerId the id of the container
#' @param expr an R expression
#' @param where a type c("beforeBegin", "afterBegin", "beforeEnd", "afterEnd")
#' @importFrom shiny insertUI
#' @importFrom utils capture.output
#' @export withConsoleRedirect
withConsoleRedirect <- function(containerId, expr, where = "beforeEnd") {
  message('Running Code')
  # Change type="output" to type="message" to catch stderr
  # (messages, warnings, and errors) instead of stdout.
  txt <- capture.output(results <- expr, type = "output")
  if (length(txt) > 0) {
    insertUI(paste0("#", containerId), where = where,
             ui = paste0(txt, "\n", collapse = "")
    )
  }
  results
}
