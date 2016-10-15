#
# Eduardo Garcia
# Shiny App for Peer-graded Assignment:
# Course Project: Shiny Application and Reproducible Pitch
#

library(shiny)
library(datasets)

shinyServer(
  function(input, output, session) {

    selectedData <- reactive({
      attitude[, c(input$xVar, input$yVar)]
    })
    
    clusterCount <- reactive({
      kmeans(selectedData(), input$clusterCount)
    })
    
    output$plot <- renderPlot({
      palette(c("#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#E41A1C", 
                "#377EB8", "#4DAF4A", "#984EA3", "#999999"))
      
      par(mar = c(5.1, 4.1, 0, 1))
      
      plot(selectedData(),col = clusterCount()$cluster, pch = 20, cex = 3)
      
      points(clusterCount()$centers, pch = 4, cex = 4, lwd = 4)
    })
    
  }
)
