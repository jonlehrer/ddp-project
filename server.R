
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {

  output$distPlot <- renderPlot({

    # generate bins based on input$bins from ui.R
    x    <- seq(-10, 10, length.out = 200)
    y    <- dt(x, df=input$df)
    z <- dnorm(x)

    #plot
    plot(x, z, ylab="p(x)", type="l", col="red", lty=3, main="Probability Distributions")
    lines(x, y)
    abline(v=qt(input$qnt, df=input$df))
    abline(v=qnorm(input$qnt), lty=3, col="red")
    
  })
  output$qnt <- renderPrint(input$qnt)
  output$df <- renderPrint(input$df)
  output$tqnt <- renderPrint(qt(input$qnt, input$df))
  output$nqnt <- renderPrint(qnorm(input$qnt))
  
})
