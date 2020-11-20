rm(list=ls())

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",destfile = "dados.csv")
dados <- read.csv("dados.csv")
View(dados)

library(xlsx)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx",destfile = "dat.xlsx",method = "curl") 
dat <- read.xlsx("dat.xlsx",sheetIndex=1,rowIndex = 18:23,colIndex = 7:15) 
                 
View(dat)
sum(dat$Zip*dat$Ext,na.rm=T)

library(XML)
file <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(file,useInternal=TRUE)
rootNode <- xmlRoot(doc)
resposta <- xpathSApply(rootNode,"//zipcode",xmlValue)
sum(resposta==21231)

