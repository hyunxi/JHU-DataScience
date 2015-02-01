library(data.table)
library(dplyr)

if(!file.exists("Quiz4_data")) {dir.create("Quiz4_data")}
fileurl<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileurl, destfile="Quiz4_data/quiz4_2.csv", method ="curl")

data <- read.csv("Quiz4_data/quiz4_2.csv", stringsAsFactors = FALSE, header = FALSE)
data <- data[(5:194), ]
b <- grep("*United",data)
a <- grep("United$",data)
c <- grep("^United",data)
# data <- gsub(",", "", data$X.3) 
# x <- mean(as.numeric(data))
print(c(a,b,c))