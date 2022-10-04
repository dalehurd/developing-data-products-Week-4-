#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

datap <- read.csv("ASA All PGA Raw Data - Tourn Level.csv", colClasses = "character") 
players <- sort(unique(datap$player))

# Define UI for application that outputs stat comparison
shinyUI(fluidPage(

    # Application title
    titlePanel("PGA Player Stat Comparisons"),

    # Sidebar with 2 input selectors
    sidebarLayout(
        sidebarPanel(
          selectInput("variable1", "Player 1:",
                      c(players)),
          selectInput("variable2", "Player 2:",
                      c(players))
          
        ),
        
        # Pass the data
        mainPanel(

            plotOutput("plot1"),
            plotOutput("plot2")
        )
    )
))
