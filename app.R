library(shiny)

load_functions <- function(functions) {
  files <- paste0(functions, ".R")
  for (file in files) {
    source(file)
  }
}
funs <- c("randomize_roles", "get_secret_role")
load_functions(funs)

players <- c("Diego", "Dani", "David", "Ale", "Hugo", "Luis", "Roberto")
players <- sample(players)
roles <- randomize_roles(players)

ui <- fluidPage(
  # List of players
  HTML("<b>List of players:</b></br>"),
  HTML(paste0(players, collapse = "</br>")),
  # Input and output
  textInput("name", "Player name"),
  verbatimTextOutput("result"),
  # Buttons
  actionButton("info_button", "Reveal role"),
  actionButton("erase_button", "Erase")
)

server <- function(input, output, session) {
  
  # Show information
  observeEvent(input$info_button, {
    output$result <- renderPrint(
      isolate(get_secret_role(input$name, roles)) # Non-reactive scope
    )
  })
  
  #Erase information
  observeEvent(input$erase_button, {
    output$result <- renderPrint("")
  })
  
}

shinyApp(ui, server)
