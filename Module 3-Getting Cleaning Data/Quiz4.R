library(data.table)
library(dplyr)

if(!file.exists("Quiz4_data")) {dir.create("Quiz4_data")}
fileurl<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileurl, destfile="Quiz4_data/quiz4.csv", method ="curl")

file <- read.csv("Quiz4_data/quiz4.csv")
names <- colnames(file)
x <- strsplit(names, "wgtp")
x[123]