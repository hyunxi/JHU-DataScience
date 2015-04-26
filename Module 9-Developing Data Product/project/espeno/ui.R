library(shiny)
library(dplyr)
require(data.table)

shinyUI(fluidPage(
  
  fluidRow(12, 
           h2("EPL Team Performance 2011-12"),
           h4("Instructions : Please be patient while the database loads")
  )
  
  fluidRow(
    column(2,
           h2("Scout's Guide"),
           p("This is a scout's guide to player's performance in EPL. To use, follow instructions below."),
           uiOutput("teamControl")
           ),
    
    column(2,
           h4("Player's List"),
           p("This is a full list of the squad players. Choose the player below"),
           uiOutput("playerControl")
    ),
    column(8,
           img(src = "my_image.png"),
           textOutput("text1"),
           textOutput("text2"),
           dataTableOutput(outputId="dTable")
           )
    
  )
  
))