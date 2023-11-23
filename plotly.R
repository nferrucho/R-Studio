#plotty
#graficos interactivos

install.packages('plotly')
library(plotly)
library(ggplot2)

datos = mtcars
head(datos)

graficos = ggplot(datos, aes(mpg, wt))
graficos = graficos + geom_point()
print(graficos)

#ggploty amplia los detalles del grafico al mousemove
grafico2 = ggplotly(graficos)
print (grafico2)
