download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",
              destfile = "Idaho.csv")
idaho <- read.csv("Idaho.csv")
library(stringr)
strsplit(names(idaho),"wgtp")
View(idaho)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",
              destfile = "gdp.csv")
gdp <- read.csv("gdp.csv")
View(gdp)

tabela <- select(gdp,X,X.3)[5:194,]   
View(tabela)

tabela1 <- mutate(tabela,GDP=gsub(",","",tabela$X.3)) %>% select(GDP)
View(tabela1)

tabela2 <- as.numeric(unlist(tabela1))
View(tabela2)
mean(tabela2)

(grep("^United",gdp$X.2))

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",
              destfile = "./data2/gdp.csv")
gdp <- read.csv("./data2/gdp.csv")
View(gdp)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",
              destfile = "./data2/edu.csv")
edu <- read.csv("./data2/edu.csv")
View(edu)

library(dplyr)
gdp <- mutate(gdp,CountryCode=X)
View(gdp)

tabela <- merge(edu,gdp)
View(tabela)

june <- grep("June 30",tabela$Special.Notes)

for (i in june){print(tabela[i,10])}
sum(june>0)

library(lubridate)
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
View(sampleTimes)

x <- year(sampleTimes)==2012
sum(x)
y <- year(sampleTimes)==2012&weekdays(sampleTimes)=="segunda-feira"
sum(y)
