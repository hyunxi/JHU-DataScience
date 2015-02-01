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
mydata$Date <- strptime(mydata$Date, "%d/%m/%y")
mydata$Global_active_power <- as.numeric(mydata$Global_active_power)

# Creating the plot:
png("plot1.png", width = 480, height = 480)
hist(mydata$Global_active_power,  main="Global Active Power",col='red',ylab= "Frequency", 
     xlab="Global Active Power(kilowatts)")
dev.off()
