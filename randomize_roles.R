#' Randomize roles
#' 
#' Give the role (liberal, fascist or Hitler) to each player randomly.
#'
#' @param names Character vector with the name of the players.
#'
#' @return Character vector with the players as names and the roles as the
#'   values.
#' @export
#'
#' @examples
#' \dontrun{
#' randomize_roles(c("Diego", "Dani", "David", "Ale", "Hugo", "Luis"))
#' }
randomize_roles <- function(names) {
  
  n <- length(names)
  
  # Number of liberals
  if (n == 5) {
    n_liberals <- 3
  } else if (n == 6 | n == 7) {
    n_liberals <- 4
  } else if (n == 8 | n == 9) {
    n_liberals <- 5
  } else if (n == 10) {
    n_liberals <- 6
  } else {
    stop("Wrong number of players")
  }
  
  # Assign roles
  res <- vector("character", length(names))
  names(res) <- sample(names)
  res[1:n_liberals] <- "Liberal"
  res[n_liberals + 1] <- "Hitler"
  res[res == ""] <- "Fascist"
  res
}
