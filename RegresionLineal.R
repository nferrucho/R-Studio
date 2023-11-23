#regresion lineal
datos = read.csv("C:/Users/User/Documents/R-Projects/student-mat.csv", sep = ';')
head(datos)
## vamos a evaluar G3 de acuerdo a los datos numericos del dataset

any(is.na(datos)) # revisar si hay datos null
#
install.packages("ggplot2", dependencies = TRUE)
install.packages('ggthemes', dependencies = TRUE)
install.packages('dplyr', dependencies = TRUE)

library(ggplot2)
library(ggthemes)
library(dplyr)
#
#vamos a generar la correlacion de variables
#
#variables numericas
col.num = sapply(datos, is.numeric)
head(col.num) #veriicamos que las columnas sean numericas

#correlacion 
datos.corr =  cor(datos[,col.num])
print(datos.corr)  #muestra la correlacion de datos unos con otros
#valores prox 0 indican menos correlacion entre variables

#paquetes para graficas
install.packages('corrgram')
install.packages('corrplot')
library (corrplot)
library (corrgram)

#grafica
grafica = corrplot(datos.corr, method = 'color')
corrgram(datos) #grafico de todas la variables

#revisando la variable G3
ggplot(datos, aes(x=G3)) + geom_histogram(bin=20, alpha= 0.5,fill='green')

##
#separamos los datos para entrenamiento y pruebas
# 70-30
install.packages('caTools')
library(caTools)
#semilla para entrenamiento
set.seed(80)

## separamos los datos para pruebas y entrenamiento
ejemplo = sample.split(datos$G3, SplitRatio = 0.7)
entrenamiento = subset(datos, ejemplo == TRUE)
pruebas = subset(datos, ejemplo == FALSE)

#modelo de regresion lineal
#y = bo + b1x + e 
#lm(y ~ x)
modelo <- lm(G3 ~. , entrenamiento) 
print (summary(modelo))
# resultado indica que las variables G1, G2 y ausencias son las importantes
# para predecir G3

"
vemos los coficientes
Estimante = coeficiente estimado para la variable de acuerdo al modelo
Std error = es la variabilidad 
t.value = indica si es significativo o no para el modelo
pr(>|t) = probailidad que una variable no sea relevante, los de **son lo importante
Adjusted R-squared:  Como el modelo se ajusta alos datos >70% es bueno
"

#calculo del residuo
# obtener la diferencia entre el valor real y estimado
residuos = residuals(modelo)
residuos = as.data.frame(residuos)
head(residuos)
# esta es la diferencia entre lo real y lo estimado
ggplot(residuos, aes(residuos)) + geom_histogram(fill='violet', alpha=0.5)
"
revisamos la tendencia a cero de los datos residuos
vemos que la tendencia a cero es considerable
entonces el modelo es apreciable.
"
#vemos la imagen de los datos y el modelo
plot(modelo)

#para hacer predicciones entonces..
predicciones = predict(modelo, pruebas)

#comparacion de predicciones y G3
resultados = cbind(predicciones,pruebas$G3)
colnames(resultados) = c('prediccion ', 'real ') #nombres a las columnas

#pasando a dataFrame
resultados = as.data.frame(resultados)
head(resultados)

min(resultados)
#ajustamos los valores que estan por debajo de cero pasandolos a cero
cero = function(x){
  if (x < 0)
    return(0) 
  else
    return(x)
}
#aplicando la funcion cero
resultados$prediccion = sapply(resultados$prediccion, cero)

min(resultados$prediccion)

#Evaluacion error cuadratico medio
error = mean((resultados$prediccion - resultados$real) ^ 2)
error # indica el margen de error entre los predict y lo real

#Validacion del error cuadratico
sse = sum( (resultados$prediccion - resultados$real) ^ 2)
sst = sum( (mean(datos$G3) - resultados$real) ^ 2)
resultado = 1 - sse / sst
resultado  #indica si el modelo se ajusta a las predicciones




