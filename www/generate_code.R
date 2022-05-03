#' Generate code for the game
#' 
#' Generate a code based on a seed and the number of players, to connect all
#' the players by the same app on the internet.
#'
#' @param n_players Numeric vector indicating the number of players
#'
#' @return A character vector with the code of the game.
#' @export
#'
#' @examples
#' \dontrun{
#' generate_code(8)
#' }
generate_code <- function(n_players) {
  seed <- sample(seq_len(999), size = 1)
  seed <- formatC(seed, width = 3, format = "d", flag = "0")
  n_players <- formatC(n_players, width = 2, format = "d", flag = "0")
  paste0(seed, ".", n_players)
}
