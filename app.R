library(shiny)
library(stringr)

source("load_functions.R")
load_functions(c("get_role", "get_number_of_liberals"))

ui <- fluidPage(
  textInput("code", "Code of the game"),
  numericInput("id", "ID of the player", value = 1, min = 1, max = 10),
  actionButton("get_info", "Get role and information"),
  verbatimTextOutput("result")
)

server <- function(input, output, session) {
  role <- eventReactive(input$get_info, get_role(input$code, input$id))
  output$result <- renderPrint(role())
}

shinyApp(ui, server)
