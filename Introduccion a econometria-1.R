#########Practica de Introduccion a RStudio
###

###Calculos Aritmeticos

a <- 8
b <- 4
c <- 7

e <- a*b*c


U <- (a-c)/log(b)

#Eliminar Comandos
rm(a,b)

####generar un objeto como vector de columna
x <- c(5,10,2,8,9,1)
x

y <- c(2,4,9,12,25,42)
y



########calcular la media, la varianza, el maximo, el minimo o la longitud del vector
mean(x)
var(x)
max(x)
min(x)
length(x)


###generar secuecnias
a <- c(1:30)
a
b <- c(18:56)
b

####### asignacion de nombres

names(x) <- c("cinco","diez","dos","ocho","nueve","uno")
x

######graficos en plot
plot(x)
help("plot")
#####color, titulo, grosor
plot(x,type = "l", lwd=3, col="blue", main="Grafico A")


#####ejemplo de modelo de regresion simple
y1 <- c(12,25,26,31,38,48,52)  ####consumo
x2 <- c(15,35,42,38,45,59,58)  ####ingreso

install.packages("lmtest")
library(lmtest)

lm(y1~x2)
 
summary(lm(y1~x2))










