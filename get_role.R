#' Get your role from the code of the game and your ID
#' 
#' Use the code of the game and your player ID (a number from 1 to 10,
#' depending on the number of players) to obtain your role and your team
#' members (if available).
#'
#' @param code Character vector containing the code of the game, obtained by the
#'   function `generate_code()`.
#' @param id Numeric vector of your player ID, from 1 to 10, depending on the
#'   number of players.
#'
#' @return
#' @export
#'
#' @examples
#' \dontrun{
#' # Player 2 is playing in the game '123.08'
#' get_role(code = "123.08", id = 2)
#' }
get_role <- function(code, id) {
  
  # Seed from code
  seed <- decode_seed(code)
  set.seed(seed)
  # Number of players from code
  n_players <- decode_n_players(code)
  # Number of liberals
  n_liberals <- get_number_of_liberals(n_players)
  
  # Roles
  roles <- vector("character", n_players)
  names(roles) <- sample(get_ids(seed = seed, n_players = n_players))
  roles[1:n_liberals] <- "Liberal"
  roles[n_liberals + 1] <- "Hitler"
  roles[roles == ""] <- "Fascist"
  
  # Blinded Hitler?
  if (n_players < 7) {
    blinded_hitler <- FALSE
  } else {
    blinded_hitler <- TRUE
  }
  
  res <- vector("list")
  # Your role
  role <- roles[id]
  res$role <- unname(role)
  fascist_team <- roles[roles == "Fascist" | roles == "Hitler"]
  fascist_team <- sample(fascist_team) # Randomize
  fascist_team <- names(fascist_team) # Only get the names
  hitler <- names(roles[roles == "Hitler"])
  if (role == "Fascist") {
    res$team_mates <- fascist_team[fascist_team != id]
    res$hitler <- hitler
  } else if (role == "Hitler" & !blinded_hitler) {
    res$team_mates <- fascist_team[fascist_team != id]
  }
  res
  
}
