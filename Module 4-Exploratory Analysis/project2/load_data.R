#Load Data

#setwd("~/Users/espen/GitHub/Module 4/project2")

if (!"neiData" %in% ls()) {
  neiData <- readRDS("./data/summarySCC_PM25.rds")
}

if (!"sccData" %in% ls()) {
  sccData <- readRDS("./data/Source_Classification_Code.rds")
}

head(neiData)
head(sccData)
dim(neiData) # 6497651   6
dim(sccData) # 11717    15
  
  