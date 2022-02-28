#supuestos
install.packages("palmerpenguins")
library(palmerpenguins)
#cargamos datos
data(package = 'palmerpenguins')
head(penguins)
df<-as.data.frame(penguins)
df<-df[complete.cases(df), ]

#creamos regresion 
Mod <- lm(body_mass_g ~ flipper_length_mm, data=df)
#linealidad
mean(Mod$residuals)
#grafica
crPlots(Mod)
install.packages("ggplot2")
library(ggplot2)
plot(Mod, 1)
crPlots(Mod)
library(ggfortify)
install.packages("ggfortify")
autoplot(Mod, 1)
install.packages("MASS")
library(MASS)
sresid <- studres(Mod)
shapiro.test(sresid)
ks.test(Mod$resid, pnorm)
plot(Mod, 2)



