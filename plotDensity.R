#ditribucion de 2 variables 
#permite comparar 2 variables 

library(ggplot2)
library(ggplot2movies)
peliculas = movies
head(peliculas)

#
grafico = ggplot(peliculas, aes(x=year, y=votes))
grafico = grafico + geom_bin2d()
print(grafico)
#ajuste color con grdiente
grafico = grafico + scale_fill_gradient2(low='yellow', high='blue')
print (grafico)

#ejemplo de densidad
grafico = ggplot(peliculas, aes(x=year, y=rating))
grafico = grafico + geom_density2d()
print(grafico)
