library(ggplot2)
source("load_data.R")

subset <- neiData[neiData$fips == "24510", ] 

png(filename = "plot3.png",width = 480, height = 480)

#Method 1 using ggplot
g <- ggplot(subset, aes(year, Emissions, color = type))
g + geom_line(stat = "summary", fun.y = "sum") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Total Emissions in Baltimore City from 1999 to 2008")

# Method 2 using qplot
# subset$year <- as.factor(subset$year)
# subset$type <- as.factor(subset$type)
# png(filename = "plot3_1.png",width = 480, height = 480)

# Bar Chart
# qplot(year, Emissions, data=subset, facets = .~type,stat="identity", geom="bar")
# qplot(year, Emissions, data=subset, facets = .~type,stat="identity", geom="bar", color=type)

# Line Chart
# qplot(year, Emissions, data=subset ,stat="summary",fun.y="sum", geom="line", color= type)

dev.off()