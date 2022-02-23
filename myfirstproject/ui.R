library(shiny)

ui <- fluidPage(
    selectInput('myselection',
                label='데이타세뜨',
                choices=c('iris','mtcars','sleep')),
    verbatimTextOutput('요야크'),
    tableOutput('떼이블')
)