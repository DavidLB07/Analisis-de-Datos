

####salario promedio por hora segun años de escolaridad
####1) vectores

años <- c(6,7,8,9,10,11,12,13,14,15,16,17,18)
sal_prom <- c(4.45,5.77,5.98,7.33,7.32,8.58,8.82,9.83,11.02,10.67,10.84,13.62,13.53) ###expresado en dolares

##2) estadisticos descriptivos

install.packages("psych")
library(psych)

describe(años)
summary(años)


describe(sal_prom)
summary(sal_prom)

######3)Histograma

hist(años, col="Blue")

boxplot(años)


hist(sal_prom, col="green", main = "Salario Promedio por hora")

boxplot(sal_prom)

####4)correlacion
cor(sal_prom,años)

muestra <- cbind(sal_prom,años)

cor(muestra)
chart.Correlation(muestra)
library("lmtest")


regresion <- lm(sal_prom~años)
summary(regresion)

plot(sal_prom~años)

abline(a=0.36571, b=0.72440)









