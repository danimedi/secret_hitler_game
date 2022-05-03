#' Get IDs for the players
#' 
#' Generate the IDs for the different players.
#'
#' @param seed Numeric vector containing the seed to control randomness.
#' @param n_players Number of players of the game.
#'
#' @return A character vector containing the IDs for each player.
#' @export
#'
#' @examples
#' \dontrun{
#' get_ids(seed = 123, n_players = 5)
#' }
get_ids <- function(seed, n_players) {
  set.seed(seed)
  replicate(n = n_players, {
    x <- sample(letters, size = 1)
    y <- sample(seq_len(99), size = 1)
    y <- formatC(y, width = 2, format = "d", flag = "0")
    paste0(x, y)
  })
}
