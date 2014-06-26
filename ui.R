library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Simulador Experimento Lentejas"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("poblac",
                  "Núm. inicial de lentejas:",
                  min = 3,
                  max = 12,
                  value = 7),
      sliderInput("factorCrecim",
                  "Factor de crecimiento:",
                  min = 3,
                  max = 6,
                  value = 3),
      sliderInput("numTiradas",
                  "Total de tiradas:",
                  min = 5,
                  max = 20,
                  value = 10)
      
    ),
    
    
      
    
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot") #,
#       h2("Tabla de datos", align='center' ) ,
#       HTML('<center>'),
#       tableOutput("datos"),
#       HTML('</center>')
    )
  )
))