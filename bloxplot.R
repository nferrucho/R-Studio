#boxplot
#represanta datos numericos por cuartiles
#x es de valor categorico
#factor = permite categorizar una varible numerica

library(ggplot2)
datos = mtcars
head(datos)

grafico = ggplot(datos, aes(x= factor(cyl), y=mpg))
grafico = grafico + geom_boxplot(fill='blue')
# en funcion a otra variable
grafico = grafico + geom_boxplot(aes(fill=factor(cyl)))
# ajustando el fondo 
grafico = grafico + theme_economist() 
print(grafico)

#permite ver los atipicos que estan fuera de las cajas

