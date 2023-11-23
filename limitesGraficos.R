#limites y dimensiones de graficos

library(ggplot2)
datos = mpg
head(datos)

#
graficos = ggplot(datos, aes(x=displ, y=cty))
graficos = graficos + geom_point()
print(graficos)
#recortando una zona del grafico
graficos = graficos + coord_cartesian(xlim = c(3,5),ylim = c(5,20))
print(graficos)

#
#cambio de dimensiones del grafico
graficos = ggplot(datos, aes(x=displ, y=cty))
graficos = graficos + geom_point()
#ratio = x/y que indica la relacion de x y 
graficos = graficos + coord_fixed(ratio = .2/1)
print(graficos)



