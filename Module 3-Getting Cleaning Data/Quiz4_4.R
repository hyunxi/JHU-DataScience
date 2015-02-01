library(data.table)
library(dplyr)

if(!file.exists("Quiz4_data")) {dir.create("Quiz4_data")}
fileurl<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileurl, destfile="Quiz4_data/quiz4_2.csv", method ="curl")

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url, destfile="Quiz4_data/quiz4_4.csv", method = "curl")

GDPdata <- read.csv("Quiz4_data/quiz4_2.csv", stringsAsFactors = FALSE, header = FALSE)
GDPdata <- GDPdata[(5:194), ]
names(GDPdata) <- c("country")

edudata <- read.csv("Quiz4_data/quiz4_4.csv", stringsAsFactors = F, header = T)
names(edudata) <- c("country")

