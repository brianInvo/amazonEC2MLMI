#

library(shiny)
library( pander )
ec2costData = read.csv( "/Users/stnava/code/amazonEC2cost/amazonEC2cost.csv" )

# Define UI for application that draws a histogram
ui <- fluidPage(

   # Application title
   titlePanel("Amazon EC2 cost estimator for population-level medical image analysis"),

   # Sidebar with a slider input for number of bins
   sidebarLayout(
      sidebarPanel(
         sliderInput("nimgs",
                     "Number of images:",
                     min = 1,
                     max = 50000,
                     value = 100)
      ),

      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

   output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
      x    <- faithful[, 2]
      bins <- seq(min(x), max(x), length.out = input$bins + 1)

      # draw the histogram with the specified number of bins
      hist(x, breaks = bins, col = 'darkgray', border = 'white')
   })
}

# Run the application
shinyApp(ui = ui, server = server)

