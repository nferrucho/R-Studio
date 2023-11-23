#scatterplots
# 2 variables continuas

library(ggplot2)
coches = mtcars 
head(coches)

#plot variables x, y
grafico = ggplot(coches, aes(x=disp, y= gear))
#colores y tamaño
grafico = grafico + geom_point(size=8, alpha= .3, color='#d6fa11')
#referncia variable 3 
grafico = grafico + geom_point(aes(size=wt))
print(grafico)

#
#manejo de gradientes
grafico = ggplot(coches, aes(x=disp, y= mpg))
#color en funcion a otra columna
grafico = grafico + geom_point(size= 8, aes(color=hp))
#degraddo de color por la variable hp
grafico = grafico + scale_color_gradient(low= 'blue', high='red')
print(grafico)

