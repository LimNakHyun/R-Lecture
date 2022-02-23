library(shiny)
library(ggplot2)


ui <- pageWithSidebar(
    headerPanel('탭패널 예제'),
    sidebarPanel(
        checkboxGroupInput('showvars',
                           '컬럼을 선택해보세요',
                           names(diamonds),
                           selected=names(diamonds)),
        helpText('사이드바')),
    mainPanel(
        tabsetPanel(
            tabPanel(title='다이아몬드',
                     dataTableOutput('table1')),
            tabPanel(title='모터카',
                     dataTableOutput('table2')),
            tabPanel(title='붓꽃',
                     dataTableOutput('table3'))
        )
    )
)

server <- function(input,output){
    
    output$table1 <- renderDataTable({
        diamonds[,input$showvars,drop=FALSE]
    })
    output$table2 <- renderDataTable({
        mtcars
    },options=list(bSortClasses=FALSE))
    output$table3 <- renderDataTable({
        iris
    },options=list(aLengthMenu=c(5,10,15),
                    iDisplayLength=5))
    
}

shinyApp(ui,server)