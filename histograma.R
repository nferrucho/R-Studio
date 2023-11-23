#graficos
#histogramas

install.packages('ggplot2movies')
library(ggplot2)
library(ggplot2movies)
peliculas = movies
head(peliculas)

#titulos
peliculas[c('title','year','rating')]

#frecuencia en que se repite rating
grafico = ggplot(peliculas, aes(x= rating))
grafico = grafico + geom_histogram()
print (grafico)

#grafico mas estrecho
grafico = ggplot(peliculas, aes(x= rating))
grafico = grafico + geom_histogram(binwidth = .3)
print (grafico)

#grafico mas estrecho y color
grafico = ggplot(peliculas, aes(x= rating))
grafico = grafico + geom_histogram(binwidth = .3, color ='green', fill='blue')
print (grafico)


#titulos y suvidad = alpha, nombres a filas y columnas
grafico = ggplot(peliculas, aes(x= rating))
grafico = grafico + geom_histogram(binwidth = .3, color ='green', fill='blue', alpha= 0.3)
grafico = grafico + xlab('Puntuacion ') +ylab('frecuencia') + ggtitle('histograma')
print (grafico)



