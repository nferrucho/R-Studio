#barplot
#una unica variable discreta: geom_bar

library(ggplot2)
datos = mpg
head(mpg)
str(datos)

#plot para datos dicretos o caracteristicas
grafico = ggplot(datos, aes(x=class)) 
grafico = grafico + geom_bar(color='red', fill= 'yellow')
print(grafico)

#en funcion a valores de otra variable
grafico = grafico + geom_bar(aes(fill=drv))
print(grafico)


