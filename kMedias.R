#k-medias
"
algortimo de aprendizaje NO SUPERVISADO
para problemas de clausters

es la particion de un conjunto de n observaciones en k grupos en el que cada observacion 
pertenece a un grupo medio mas cercano

Aplica mineria de datos"

library(ISLR)
datos = iris
str(datos)

#vamos a obtener Species
#grafico para agrupamiento
library(ggplot2)
grafico = ggplot(datos, aes(Petal.Length, Petal.Width, color=Species))
grafico = grafico + geom_point(size= 2)
print(grafico)

#modelo k-medias
"
reunimos las 4 primeras columnas [,1:4]
como son 3 grupos de especies => 3

"
set.seed(90)
conjuntos = kmeans(datos[,1:4], 3, nstart = 20)
print (conjuntos)
#los datos quedan agrupados en3 grupos y la CLUSTER son la respuesta del modelo
#Hacemos una tabla para ver el conjunto de datos

table(conjuntos$cluster, datos$Species)
# aqui se ve la distribucion de los conjuntos

#replesentacion grafica por circulos reuniendo los grupos
library(cluster)
clusplot(datos, conjuntos$cluster, color=TRUE, shape= TRUE, labels= 0, lines=0)

help("kmeans")
help("clusplot")


