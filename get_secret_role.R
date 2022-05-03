#' Get your secret role from your name
#' 
#' Use your name to access your secret role and the information about your
#' team-mates, if available.
#'
#' @param name Character vector of one player name.
#' @param roles Character vector of the roles of the players, this is the result
#'   of the function `randomize_roles()`.
#'
#' @return List with two elements: the role of the player and the members of
#'   his/her team, if available.
#' 
#' @export
#'
#' @examples
#' \dontrun{
#' roles <- randomize_roles(c("Diego", "Dani", "David", "Ale", "Hugo", "Luis"))
#' get_secret_role("Diego", roles)
#' }
get_secret_role <- function(name, roles) {
  
  # Blinded Hitler?
  n <- length(roles)
  if (n < 7) {
    blinded_hitler <- FALSE
  } else {
    blinded_hitler <- TRUE
  }
  
  res <- vector("list", 2L)
  names(res) <- c("role", "team_members")
  role <- roles[name]
  res$role <- role
  fascist_team <- roles[roles == "Fascist" | roles == "Hitler"]
  fascist_team <- sample(fascist_team) # Randomize
  fascist_team <- names(fascist_team) # Only get the names
  if (role == "Fascist") {
    res$team_members <- fascist_team
  } else if (role == "Hitler" & !blinded_hitler) {
    res$team_members <- fascist_team
  } else {
    res$team_members <- "You don't have access to this information."
  }
  res
}
