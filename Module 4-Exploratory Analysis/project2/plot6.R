library(ggplot2)
source("load_data.R")

#Subsetting LA - "06037" and Baltimore - "24510"
subset <- neiData[neiData$fips == "24510"|neiData$fips == "06037", ]

motor <- grep("motor", sccData$Short.Name, ignore.case = T)
motor <- sccData[motor, ]
motor <- subset[subset$SCC %in% motor$SCC, ]

#Method 1
png(filename = "plot6.png", width = 480, height = 480)
g <- ggplot(motor, aes(year, Emissions, color = fips))
g + geom_line(stat = "summary", fun.y = "sum") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Comparison of Total Emissions From Motor\n Vehicle Sources in Baltimore City\n and Los Angeles County from 1999 to 2008") +
  scale_colour_discrete(name = "City", label = c("Los Angeles","Baltimore"))
dev.off()

#Method 2
motorEmissions <- aggregate(motor$Emissions, list(motor$fips, motor$year), FUN = "sum")
names(motorEmissions) <- c("fips","Year","Emissions")

png(filename = "plot6-1.png", width = 1080, height = 760)
g <- ggplot(motorEmissions, aes(Year, Emissions, color=fips))
g + geom_smooth(stat = "identity") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Comparison of Total Emissions From Motor\n Vehicle Sources in Baltimore City\n and Los Angeles County from 1999 to 2008") +
  scale_colour_discrete(name = "City", label = c("Los Angeles","Baltimore")) 
dev.off()