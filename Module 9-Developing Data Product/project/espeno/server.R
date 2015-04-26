library(shiny)

# Load data processing file
source("data_prepare.R")
teams <- sort(unique(data$Team))


# Shiny server
shinyServer(function(input, output) {
  
  # Create event type checkbox
  output$teamControl <- renderUI({
                       radioButtons('teams', 'Choose a Team:', 
                       teams, selected = teams[1])
                      })
  
  output$playerControl <- renderUI({
                        players <- groupByTeam(data, input$teams)
                        players <- sort(unique(players$player_surname))
                        
                        radioButtons('players', 'Choose a Player:', 
                        players, selected = players[1])
                        })
    
  output$text1 <- renderText({
                    paste("You have selected", input$teams)
                  })
  
  output$text2 <- renderText({
                    paste("For player, you have selected", input$players)
                  })
  
  # Prepare Dataset
  dataTable <- reactive({
      groupByPlayer(data, input$teams, input$players)         
  })
  
  
  # Render data table
  output$dTable <- renderDataTable({
                  dataTable()
  } #, options = list(bFilter = FALSE, iDisplayLength = 50)
  )
  
  
  } # end of function(input, output)
)