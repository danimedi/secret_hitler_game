#' Create the code of the game and the IDs of the players
#' 
#' This function uses the functions `generate_code()` and `get_ids()` to create
#' the code and the IDs to start a game.
#'
#' @param n_players Numeric vector of the number of players.
#'
#' @return List containing the code of the game and the IDs of the players.
#' @export
#'
#' @examples
#' \dontrun{
#' create_game(n_players = 7)
#' }
create_game <- function(n_players) {
  code <- generate_code(n_players)
  seed <- decode_seed(code)
  set.seed(seed)
  ids <- get_ids(seed, n_players)
  list(
    code = code,
    ids = ids
  )
}
