# Load packages ----
library(shiny)
library(maps)
library(mapproj)

# Load data ----
counties <- readRDS("counties.rds")

# Source helper functions -----
source("helpers.R") #함수들을 직접 사용하겠다.

# User interface ----
ui <- fluidPage(
  titlePanel("censusVis"),
  
  sidebarLayout( #전체 레이아웃에
    sidebarPanel( #패널을 만들고
      helpText("Create demographic maps with 
               information from the 2010 US Census."), #위에 설명문구 집어넣는것  
      
      selectInput("var", #사용자가 선택가능한것 selectinput은 인종 선택하는것 c를 통해서  단어를 명시
                  label = "Choose a variable to display",
                  choices = c("Percent White", "Percent Black",
                              "Percent Hispanic", "Percent Asian"),
                  selected = "Percent White"), #초깃값 지정 키자마자 이거나오는것
      
      sliderInput("range",  
                  label = "Range of interest:", #변수 이름
                  min = 0, max = 100, value = c(0, 100))  #사이드바는 사용자 움직임으로 인해 들어오는 변수 value = c(0, 100)는 처음 들어갔을떄의 초기값
      ),
    
    mainPanel(plotOutput("map")) #서버에서 map으로 가시화
  )
  )

# Server logic ----
server <- function(input, output) {
  output$map <- renderPlot({
    args <- switch(input$var, #내 선택에 따라 다른결과가 나오도록
                   "Percent White" = list(counties$white, "darkgreen", "% White"),
                   "Percent Black" = list(counties$black, "black", "% Black"),
                   "Percent Hispanic" = list(counties$hispanic, "darkorange", "% Hispanic"),
                   "Percent Asian" = list(counties$asian, "darkviolet", "% Asian"))
    
    args$min <- input$range[1]
    args$max <- input$range[2]
    
    do.call(percent_map, args) #함수를 불러온다 r에서 씨나 자바나 부를때 쓴다. 그렇지만 알에 내장되어있는 함수를 호출할때도 쓴다.

      })
}
# Run app ----
shinyApp(ui, server)