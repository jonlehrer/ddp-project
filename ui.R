
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("T-distribution versus Normal Distribution"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("df",
                  "Degrees of Freedom:",
                  min = 1,
                  max = 20,
                  value = 5),
      sliderInput("qnt",
                  "Quantile:",
                  min = 0.01,
                  max = 0.99,
                  value = .95),
      p("This app allows you to compare various T-distributions and quantiles (in black) to the normal distribution and normal quantiles (in red)."),
      p("Use the sliders above to select the number of degrees of freedom for the T-distribution, and at which quantile to display a vertical line."),
      p("Note that as the degrees of freedom increase, the T-distribution approaches the Normal distribution.")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
      p("You Entered the Following Degrees of Freedom"),
      verbatimTextOutput("df"),
      p("You entered the Following Quantile"),
      verbatimTextOutput("qnt"),
      p("Normal Quantile:"),
      verbatimTextOutput("nqnt"),
      p("T Quantile:"),
      verbatimTextOutput("tqnt")
    )
  )
))
