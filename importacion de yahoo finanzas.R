library(quantmod)
install.packages("quantmod")
###########paqueteria
ipak <- function(pkg){  
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg))
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}

packages <- c("lubridate","tidyverse","car","tseries","astsa","foreign","timsac","vars","lmtest","broom","KableExtra","knitr","MASS","parallel","car","mlogit","dplyr","tidyr","forecast","fpp2","stats","quantmod")
ipak(packages)



mdate= "2001-01-03"
amazonprices=getSymbols('AMZN', from=mdate, auto.assign =F)
print(amazonprices)


mdate1="2001-01-04"
amazonprices1=getSymbols('AMZN', from=mdate, auto.assign=F)[,4]

print(amazonprices1)


#tasa de crecimiento

amazonroc=ROC(amazonprices1, type = 'discret')
print(amazonroc)


amznrend=periodReturn(amazonprices1,period = 'monthly', type = 'log', subset = '2020')    
amznrend

#####Obtener datos del S&P 500

getSymbols("^GSPC", src = "yahoo", from = "2010-01-01", to = "2020-05-30", periodicity = "daily")
print(GSPC)
chartSeries(GSPC, TA=NULL)


chartSeries(GSPC, subset = "last 3 months")

IPC MEXICO (^MXX)
#Obtener datos del IPC bolsa de valores de Mexico

getSymbols("^MXX", src = "yahoo", from = "2010-01-01", to = "2020-05-30", periodicity = "daily")
print(MXX)
chartSeries(MXX, TA=NULL)
chartSeries(MXX, subset = "last 3 months")


