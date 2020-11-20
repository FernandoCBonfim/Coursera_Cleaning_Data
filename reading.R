rm(list=ls())

fileurl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileurl, destfile="cameras.csv")
a <- read.csv("cameras.csv")
View(a)

Camera <- read.table("./data/camera.csv",sep=",",header =TRUE)
head(Camera)
View(Camera)

library(xlsx)
Pasta <- read.xlsx("./data/Pasta1.xlsx",sheetIndex=1,header = TRUE)
head(Pasta)

library(XML)
file2 <- "teste.xml"
doc <- xmlTreeParse(file2,useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
rootNode[[1]][[1]][[1]][[1]]

library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)
