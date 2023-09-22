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
  titlePanel("Densidad de la Distribución Normal"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("mean", "Media:", min = -5, max = 5, value = 0, step = 0.1),
      sliderInput("sd", "Desviación estándar:", min = 0.01, max = 10, value = 1, step = 0.01)
    ),
    
    mainPanel(
      plotOutput("plot")
    )
  )
)

server <- function(input, output) {
  output$plot <- renderPlot({
    x <- seq(-25, 25, length = 500)
    y <- dnorm(x, mean = input$mean, sd = input$sd)
    
    ggplot() +
      geom_line(aes(x, y), color = "blue", linewidth = 1) +
      geom_vline(xintercept = input$mean, color = "red", linetype = "dashed", size = 1) +
      geom_vline(xintercept = input$mean-2*input$sd, color = "green", linetype = "dashed", size = 1) +
      geom_vline(xintercept = input$mean+2*input$sd, color = "green", linetype = "dashed", size = 1) +
      labs(x = "X", y = "Densidad") +
      xlim(-25, 25) +
      ylim(0, max(y) + 0.1) +
      ggtitle("Densidad de la Distribución Normal")
  })
}

shinyApp(ui, server)