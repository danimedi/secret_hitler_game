#' Load functions by their names (file names)
#'
#' @param functions Character vector with file names (without the ".R").
#'
#' @return
#' @export
#'
#' @examples
#' \dontrun{
#' funs <- c("randomize_roles", "get_secret_role")
#' load_functions(funs)
#' }
load_functions <- function(functions) {
  files <- paste0(functions, ".R")
  for (file in files) {
    source(file)
  }
}
