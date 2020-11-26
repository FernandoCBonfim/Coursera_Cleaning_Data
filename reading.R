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

con = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en") 
htmlCode = readLines(con) 
close(con) 
View(htmlCode)

if(!file.exists("./data2")) {dir.create("./data2")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile="./data2/restaurants.csv")

restData <- read.csv("./data2/restaurants.csv")
restData$near <- restData$neighborhood %in% c("Roland Park","Homeland")
restData$near <- restData$neighborhood=="Roland Park" | restData$neighborhood=="Homeland"

table(restData$near)

fileurl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileurl, destfile="./data/cameras.csv")
cameraData <- read.csv("./data/cameras.csv")
names(cameraData)
tolower(names(cameraData))
View(cameraData)
