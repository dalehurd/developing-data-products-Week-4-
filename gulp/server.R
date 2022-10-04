#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

datap <- read.csv("ASA All PGA Raw Data - Tourn Level.csv", colClasses = "character") 
players <- sort(unique(datap$player))

# Define server logic required prepare stats
shinyServer(function(input, output) {
  output$plot1 <- renderPlot({

    pr1 <- datap[datap$player==input$variable1,]


    dataX1 <- pr1$Finish
    dataX1fixed <- gsub('T','',dataX1)
    dataY1 <- pr1$sg_total




        plot(dataX1fixed, dataY1
             , 
             xlab = "Finish", ylab = "SG Total", main = input$variable1,
             xlim = c(0,70), ylim = c(-5,5))

        })
  output$plot2 <- renderPlot({
    
    pr2 <- datap[datap$player==input$variable2,]
    
    
    dataX2 <- pr2$Finish
    dataX2fixed <- gsub('T','',dataX2)
    dataY2 <- pr2$sg_total
    
    
    
    
    plot(dataX2fixed, dataY2
         , 
         xlab = "Finish", ylab = "SG Total", main = input$variable2,
         xlim = c(0,70), ylim = c(-5,5))
    
  })
})
