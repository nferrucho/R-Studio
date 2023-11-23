#Random forest
"
es la cmbinacion de arboles de decision donde cada arbol selecciona
una clase y luego se combinan decisiones de cada arbol para seleccionar
la clase final ganadora.
Es muy preciso y funciona para bd grandes"

install.packages('randomForest')
library(randomForest)

#modelo: cargamos el dataset Kyphosis datos en data
modelo = randomForest(Kyphosis ~ . , data=datos)
modelo

#calculo de predicciones
modelo$predicted