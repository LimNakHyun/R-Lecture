library(shiny)

ui <- pageWithSidebar(
    headerPanel(h1('Hello, Shiny!')),
    sidebarPanel('Sidebar'),
    mainPanel('Main')
)

server <- function(input,output){
    
}

shinyApp(ui,server)