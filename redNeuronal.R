#Redes Neuronales
"
Y = SUM(ax +e)
"
install.packages("MASS")
library(MASS)

datos = Boston
head(datos)

#ver datos nulos
any(is.na(datos))

#Proceso de normalizacion de datos
#ver los max y los min para hacerlos centrados
maximo = apply(datos,2,max)
minimo = apply(datos,2,min)

#normalizacion de datos
datos.normalizados = scale(datos,center = minimo, scale=maximo-minimo)

datos.normalizados = as.data.frame(datos.normalizados)
head(datos.normalizados)

#generacion del modelo
#datos de entrenamiento 70
#datos de prueba 30
#columna objetivo de medv
library(caTools)

division = sample.split(datos.normalizados$medv, SplitRatio = 0.7) #rango del 0.7
entrenamiento = subset(datos.normalizados, division == TRUE)
pruebas = subset(datos.normalizados, division== FALSE)

head(entrenamiento)
head(pruebas)

install.packages("neuralnet")
library(neuralnet)

#modelo
formula = medv ~ crim + zn + chas + nox +  rm + age +dis + rad+ tax + ptratio + black + lstat
"
data = entrenamiento
capas ocultas = 2 => (5,3) un grpo de 5 entrada 3 de ajuste
"
red.neuronal= neuralnet(formula, data= entrenamiento, hidden=c(5,3), linear.output = TRUE)

#representacion grafica
plot(red.neuronal)
"aparecen los datos de entrada de acuerdo a la formula
 aparecen 5 neuronas ocultas intermedias
 aparecen 3 neuronas ocultar de refuerzo
 neurna salida de la variable medv"

#Predicciones de las 13 columnas de pruebas 
predicciones = compute(red.neuronal, pruebas[1:13])
str(predicciones)

"para ver la prediccion real:
debemos des-normalizar los datos
a las predicciones como a los datos de pruebas"

predicciones.correctas = predicciones$net.result * (max(datos$medv) - min(datos$medv)) + min(datos$medv)
pruebas.convertidas = (pruebas$medv) * (max(datos$medv) - min(datos$medv)) + min(datos$medv)

#calculo del error
error = sum((pruebas.convertidas - predicciones.correctas) ^ 2) /nrow (pruebas)
error #error del 14% 

#dataset para compara el valor real y el valor prediccion 
errores = data.frame(pruebas.convertidas, predicciones.correctas)
head(errores)

#un grafica para esta comparacion 
library(ggplot2)
grafico = ggplot(errores, aes(x= pruebas.convertidas, y=predicciones.correctas))
grafico = grafico + geom_point()
print(grafico)

#queda por ajustar el numero de capas ocultas y el numero de neuronas para cada capa 
# de esta forma se ajusta el error



