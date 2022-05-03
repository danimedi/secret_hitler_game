library(shiny)
library(stringr)
library(purrr)

walk(list.files("www", full.names = TRUE, pattern = "[.]R$"), source)

ui <- fluidPage(
  
  # Create game
  numericInput("n_players", "Number of players", value = 5, min = 5, max = 10),
  actionButton("create_game", "Create game"),
  verbatimTextOutput("game_code"),
  
  HTML("<hr>"),
  
  # Get roles
  textInput("code", "Code of the game"),
  textInput("id", "ID of the player"),
  actionButton("get_info", "Get role and information"),
  verbatimTextOutput("result")
)

server <- function(input, output, session) {
  
  # Create game
  observeEvent(input$create_game, {
    output$game_code <- renderPrint(create_game(input$n_players))
  })
  
  # Get roles
  role <- eventReactive(input$get_info, get_role(input$code, input$id))
  output$result <- renderPrint(role())
}

shinyApp(ui, server)
