library(dplyr)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",
              destfile = "./data2/us.csv")
dados <- read.csv("./data2/us.csv")
View(dados)
agricultureLogical <- dados$ACR>=3 & dados$AGS==6
which(agricultureLogical) 

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",
              destfile = "./data2/gdp.csv")
gdp <- read.csv("./data2/gdp.csv")
View(gdp)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",
              destfile = "./data2/edu.csv")
edu <- read.csv("./data2/edu.csv")
View(edu)

gdp <- mutate(gdp,CountryCode=X)
View(gdp)

tabela <- merge(edu,gdp)
View(tabela)

tabela1 <- tabela %>% arrange(desc(as.numeric(Gross.domestic.product.2012)))%>%
  select(CountryCode,Long.Name,X.2,Gross.domestic.product.2012)%>% filter(Gross.domestic.product.2012>0)

tabela2 <- tabela%>%
  mutate(GDP=as.numeric(Gross.domestic.product.2012))%>%
  select(CountryCode,Income.Group,GDP)%>% 
  na.omit%>%
  group_by(Income.Group)%>%
  summarise(avg_GDP=mean(GDP))
View(tabela2)

tabela3 <- tabela%>%
  mutate(GDP=as.numeric(Gross.domestic.product.2012))%>%
  select(CountryCode,Income.Group,GDP)%>% 
  na.omit
View(tabela3)

q <- quantile(tabela3$GDP,probs = c(0,0.2,0.4,0.6,0.8,1))
print(q)
tabela4 <- mutate(tabela3,Q1=GDP<38.6,Q2=GDP>=38.6&GDP<76.2,Q3=GDP>=76.2&GDP<113.8,Q4=GDP>=113.8&GDP<152.4,Q5=GDP>=152.4)
View(tabela4)

tabela4 %>% group_by(Income.Group) %>% summarise(across(starts_with("Q"),sum))

