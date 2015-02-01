#library(dplyr)
source("load_data.R")

#specify some important base graphics params
par(bg = "grey", mar=c(5.1, 4.5, 4.1, 2.1), lty = 2 )

png(filename = "plot2.png",width = 480, height = 480)

subset <- neiData[neiData$fips == "24510", ] 
totalEmissions <- aggregate(subset$Emissions, list(subset$year), FUN = "sum")

#Method 1
plot(totalEmissions, 
     type = "l", 
     main = "Total Emissions in the Baltimore from 1999 to 2008", 
     xlab = "Year", 
     ylab = expression('Total PM'[2.5]*" Emission"))

#Method 2
#plot(as.data.table(neiData)[, list(TotalEmissions=sum(Emissions)), by=year], type ="o")
dev.off()