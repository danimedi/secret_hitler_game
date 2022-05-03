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
  n_liberals<- get_number_of_liberals(length(names))
  
  # Assign roles
  res <- vector("character", length(names))
  names(res) <- sample(names)
  res[1:n_liberals] <- "Liberal"
  res[n_liberals + 1] <- "Hitler"
  res[res == ""] <- "Fascist"
  res
}
