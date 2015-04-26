
# Load required libraries
require(data.table)
library(XLConnect)
library(dplyr)

# Read data
dir <- c("./data/Premier League 2011-12 Match by Match.xls")
data <- readWorksheetFromFile(dir, 1)

head(data)
setnames(data, "Player.Surname", "player_surname")
setnames(data, "Player.Forename", "player_forename")

# Exploratory data analysis
sum(is.na(data)) # 0
length(unique(data$Team)) # 20 Teams
# players <- sort(unique(data$player_surname))


# Sort players by team selected
groupByTeam <- function(data, teamSelected){
  result <- data %>% filter(Team == teamSelected)
  return(result)
}

groupByPlayer <- function(data, teamSelected, playerSelected){
  result <- groupByTeam(data, teamSelected)
  result <- result %>% filter(player_surname == playerSelected)
  return(result)
}

# Aggregate data by Goals by Team
groupByGoals <- function(data, minGoal, maxGoal, team) {
  result <- data %>% filter(Goals >= minGoal, Goals <= maxGoal,
                            Team == team) 
  return(result)
}

plotTeamGoalsbyDate <- function(data, team){
  plotData <- groupByGoals(data, 0,9, team)
  ggplot(plotData, aes(x=Date,y=Goals)) + geom_line() 
}
