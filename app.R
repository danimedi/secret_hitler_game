library(shiny)
library(stringr)

source("load_functions.R")
load_functions(c("get_role", "get_number_of_liberals"))

ui <- fluidPage(
  textInput("code", "Code of the game"),
  textInput("id", "ID of the player"),
  actionButton("get_info", "Get role and information"),
  verbatimTextOutput("result")
)

server <- function(input, output, session) {
  role <- eventReactive(input$get_info, get_role(input$code, input$id))
  output$result <- renderPrint(role())
}

shinyApp(ui, server)
