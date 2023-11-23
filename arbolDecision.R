#Arboles de decision 
#
"A partir de un conjunto de datos se realiza la categorizacion
de un conjunto de condiciones que ocurren de forma sucesiva
para resolver un problema"

library(rpart) # recursive partirioning and regression tree

datos = kyphosis
str(datos)
#la variable objetivo de Kyphosis
# a partir de age, number e start

#modelo
arbol = rpart(kyphosis, datos)
arbol

#informacion del arbol generado
printcp(arbol)

#generacion de la grafica
plot(arbol, uniform = TRUE, main='arbol de decision')
text(arbol, use.n = TRUE, all=TRUE)

# otra forma de diagramar la decision
install.packages('rpart.plot')
library(rpart.plot)
prp(arbol)
