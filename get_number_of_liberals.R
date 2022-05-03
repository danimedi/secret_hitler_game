#' Get the number of liberals
#' 
#' Obtain the number of liberals in the game based on the total number of
#' players.
#'
#' @param n_players Numeric vector containing the number of players
#'
#' @return
#' @export
#'
#' @examples
#' \dontrun{
#' get_number_of_liberals(9)
#' }
get_number_of_liberals <- function(n_players) {
  if (n_players == 5) {
    n_liberals <- 3
  } else if (n_players == 6 | n_players == 7) {
    n_liberals <- 4
  } else if (n_players == 8 | n_players == 9) {
    n_liberals <- 5
  } else if (n_players == 10) {
    n_liberals <- 6
  } else {
    stop("Wrong number of players")
  }
  n_liberals
}
