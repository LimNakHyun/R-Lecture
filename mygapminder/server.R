library(shiny)
library(ggplot2)
library(gapminder)


server <- function(input,output){
    output$plot <- renderPlot({
        ggplot(gapminder,aes(gdpPercap,lifeExp,
                             color=continent))+
            geom_point()+
            scale_x_log10(labels=scales::dollar)+
        theme_classic()
    },res=96)
    output$data <- renderTable({
        req(input$plot_click)
        nearPoints(gapminder,input$plot_click)
    })
}