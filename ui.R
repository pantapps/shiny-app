#
# Eduardo Garcia
# Shiny App for Peer-graded Assignment:
# Course Project: Shiny Application and Reproducible Pitch
#

library(shiny)
library(datasets)

# Define UI for application that draws a histogram
shinyUI(
  navbarPage(
    "Chatterjee–Price Attitude k-means clustering",
    tabPanel("Plot",
             sidebarLayout(
               sidebarPanel(
                 selectInput('xVar', 'X Variable', names(attitude)),
                 selectInput('yVar', 'Y Variable', names(attitude),
                             selected=names(attitude)[[2]]),
                 numericInput('clusterCount', 'Cluster count', 3,
                              min = 1, max = 9)
               ),
               mainPanel(
                 plotOutput('plot')
               )
             )
    ),
    tabPanel("Documentation",
        includeHTML("documentation.html")    
    )
  )
)     



