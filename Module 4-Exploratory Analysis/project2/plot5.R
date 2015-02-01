library(ggplot2)
source("load_data.R")

subset <- neiData[neiData$fips == "24510", ] 

motor <- grep("motor", sccData$Short.Name, ignore.case = T)
motor <- sccData[motor, ]
motor <- subset[subset$SCC %in% motor$SCC, ]
motorEmissions <- aggregate(motor$Emissions, list(motor$year), FUN = "sum")

#Method 1
#png(filename = "plot5.png", width = 480, height = 480)
#plot(motorEmissions, type = "l", xlab = "Year", 
#     main = "Total Emissions:Motor Vehicle Sources from 1999 to 2008 in Baltimore", 
#     ylab = expression('Total PM'[2.5]*" Emission"))

#Method 2
png(filename = "plot5_1.png", width = 480, height = 480)
g <- ggplot(motorEmissions, aes(Group.1, x))
g + geom_bar(stat="identity",color="blue") + 
     ggtitle("Total Emissions:Motor Vehicle Sources from 1999 to 2008 in Baltimore") +
     xlab("Year") +
     ylab(expression('Total PM'[2.5]*" Emissions"))

dev.off()
