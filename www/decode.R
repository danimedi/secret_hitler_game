#' Functions to get infomation from the code of the game
#' 
#' Get the seed and the number of players from the code of the game.
#'
#' @param code Character vector with the code of the game
#'
#' @return
#' @export
#'
#' @examples
decode_seed <- function(code) {
  str_sub(code, 1, 3)
}

#' @rdname decode_seed
decode_n_players <- function(code) {
  n_players <- str_sub(code, -2, -1)
  as.double(n_players)
}
