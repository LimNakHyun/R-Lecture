# install.packages('shiny')
library(shiny)

ui <- fluidPage(
    h1('Hello, shiny'),
    img(src='https://steamcdn-a.akamaihd.net/steam/apps/783180/ss_d6e7de24c864b9ce03bf3ad7959847aa35b68c7f.1920x1080.jpg?t=1558495915')
)

server <- function (input,output) {
    # Do something here!
}

shinyApp(ui,server)