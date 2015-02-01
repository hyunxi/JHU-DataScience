library(data.table)
library(lubridate)

#setwd("~/GitHub/Module 4/project1/Project1/")

#if (!file.exists("data")) {dir.create("data")}
#fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(fileurl, destfile="data/power.zip" , method ="curl")
#unzip("data/power.zip")

x <- "household_power_consumption.txt"

mydata <- read.table(x, header = T, sep=";", stringsAsFactors = F)

#Subsetting the dates
date1 <- c("1/2/2007")
date2 <- c("2/2/2007")
mydata <- subset(mydata, (mydata$Date == date1 | mydata$Date == date2 ))

# Changing the class of Date variable from character to Date: 
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
# Combining the Date and Time variable and creating a new column in dataset named "DateTime":
mydata$DateTime <- as.POSIXct(paste(mydata$Date, mydata$Time))

# Creating the plot3:
png("plot3.png", width = 480, height = 480)
plot(mydata$DateTime, mydata$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(mydata$DateTime, mydata$Sub_metering_2, type="l", col="red")
lines(mydata$DateTime, mydata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()