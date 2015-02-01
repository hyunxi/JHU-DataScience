# Example on Getting and Cleaning Data (Quiz 3)
# https://class.coursera.org/getdata-008/forum/thread?thread_id=7

library(downloader)
download("https://raw.githubusercontent.com/thoughtfulbloke/faoexample/master/appleorange.csv", destfile="appleorange.csv")
download("https://raw.githubusercontent.com/thoughtfulbloke/faoexample/master/stability.csv", destfile="stability.csv")

ao <- read.csv("appleorange.csv")
str(ao)

aoraw <- read.csv("appleorange.csv", stringsAsFactors=FALSE, header=FALSE)

#data is actually between rows 3 to 700
aodata <- aoraw[3:700, ]
names(aodata) <- c("country", "countrynumber", "products", "productnumber", 
"tonnes", "year")
aodata$countrynumber <- as.integer(aodata$countrynumber)

#A lot of lines saying Food supply quantity (tonnes) (tonnes) we do not need.
fslines <- which(aodata$country == "Food supply quantity (tonnes) (tonnes)")
aodata <- aodata[(-1*fslines),]

#The tonnes needs replacment of text to get it into numbers format
aodata$tonnes <- gsub("\xca", "", aodata$tonnes)
aodata$tonnes <- gsub(", tonnes \\(\\)", "", aodata$tonnes)
aodata$tonnes <- as.numeric(aodata$tonnes)

aodata$year <- 2009

#merging data method 1
apples <- aodata[aodata$productnumber == 2617, c(1,2,5)]
names(apples)[3] <- "apples"

oranges <- aodata[aodata$productnumber == 2611, c(2,5)]
names(oranges)[2] <- "oranges"

cleanao2 <- merge(apples, oranges, by = "countrynumber", all = TRUE) 
# all=TRUE was set so that if you only have an apple or and orange value then the country will still appear in the wide data list.


#merging data method 2
library(reshape2)
cleanao3 <- dcast(aodata[, c(1:3,5)], formula = country + countrynumber ~ products, value.var = "tonnes")
names(cleanao3)[3:4] <- c("apples", "oranges")

#make a frequency table of country names and subsetting it
table(aodata$country)[table(aodata$country) == 1]