library(ggplot2)
source("load_data.R")

png(filename = "plot4.png", width = 480, height = 480)

coal <- grep("coal", sccData$Short.Name, ignore.case = T)
coal <- sccData[coal, ]
coal <- neiData[neiData$SCC %in% coal$SCC, ]

coalEmissions <- aggregate(coal$Emissions, list(coal$year), FUN = "sum")

# Method1
#plot(coalEmissions, type = "l", xlab = "Year", 
#     main = "Total Emissions From Coal Combustion-related\n Sources from 1999 to 2008", 
#     ylab = expression('Total PM'[2.5]*" Emission"))

# Method2
g <- ggplot(coalEmissions, aes(Group.1, x))
g + geom_line() + ylab(expression('Total PM'[2.5]*" Emissions")) + xlab("Year") +
  ggtitle("Total Emissions:Coal Combustions from 1999 to 2008")

dev.off()
