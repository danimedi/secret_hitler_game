library(shiny)
library(stringr)
library(purrr)

walk(list.files("www", full.names = TRUE, pattern = "[.]R$"), source)

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
