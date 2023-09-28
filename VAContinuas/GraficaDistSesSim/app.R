#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

ui <- fluidPage(
  titlePanel("Distribución beta"),
  sidebarLayout(
    sidebarPanel(
      numericInput(inputId = "shape1", label = "Parámetro de forma 1", value = 1),
      numericInput(inputId = "shape2", label = "Parámetro de forma 2", value = 1),
      sliderInput(inputId = "n", label = "Número de puntos", min = 10, max = 100, value = 20)
    ),
    mainPanel(
      plotOutput(outputId = "plot")
    )
  )
)

server <- function(input, output) {
  output$plot <- renderPlot({
    data <- seq(0,1,length.out=input$n)
    d.data <- dbeta(data,input$shape1, input$shape2)
    data <- data.frame(x = data, y = d.data)
    return(ggplot(data = data, aes(x = x, y = y)) +
             geom_line(color = "red") +
             labs(title = "Distribución beta", ylab = "Densidad")
    )
  })
}

shinyApp(ui = ui, server = server)