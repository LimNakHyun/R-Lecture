library(shiny)

server <- function (input,output) {
    output$요야크 <- renderPrint({
        dataset <- get(input$myselection,'package:datasets')
        summary(dataset)
    })
    output$떼이블 <- renderTable({
        dataset <- get(input$myselection,'package:datasets')
        dataset
    })
}