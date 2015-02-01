install.packages("quantmod")

library(data.table)
library(dplyr)
library(quantmod)

amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 

year <- length(sampleTimes[year(sampleTimes)== 2012])
day <- length(sampleTimes[year(sampleTimes)== 2012 & weekdays(sampleTimes, label = TRUE) == "Monday"])#number for June 2010
print(c(year, day))