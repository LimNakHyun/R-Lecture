library(shiny)


ui <- pageWithSidebar(
    headerPanel('나의 mtcars 반응형 웹앱'),
    sidebarPanel(
        selectInput(inputId='variable',
                    '컬럼을 선택해바바',
                    list('실린더'='cyl',
                         '트랜스미션'='am',
                         '기어'='gear')),
        checkboxInput('outliers',
                      '이상치도 보여주삼',
                      FALSE)
    ),
    mainPanel(
        plotOutput('mpgPlot')
    )
)




mpgData <- mtcars
mpgData$am <- factor(mtcars$am,
                     labels=c('Automatic',
                              'Manual'))

server <- function(input,output){
    
    formulaText <- reactive({
        paste('mpg~',input$variable)
    })
    output$caption <- renderText({
        formulaText()
    })
    
    output$mpgPlot <- renderPlot({
        boxplot(as.formula(formulaText()),
                data <- mpgData,
                outline=input$outliers,
                col='lightyellow')
    })
}

shinyApp(ui,server)

