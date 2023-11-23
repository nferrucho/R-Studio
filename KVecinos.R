#k vecinos mas cercanos
"Clasificacion supervisada

Es la probabilida de que X pertencezca a la clase C a partir de unos datos.

Se usa para reconocimiento de patrones en la clasificacion de objetos mediante
el entrenamiento de ejemplos cercanos en el espacio de los elementos

Algotirmo:
1. obtener la distancia a un punto centro para el espacio
2. ordenar los puntos en funcion de la distancia centro al punto de menor a mayor
3. Predicion -> el punto centro pertenece por n kcercanos a que grupo a azules o rojos"

install.packages('ISLR', dependencies = TRUE)
library(ISLR)

#datos para ejemplo, datos de seguros
#vamos a estimar la columna Purchase

datos = Caravan

#quienes han comprado seguros o no
summary(datos$Purchase)

#revisar si hay datos vacios
any(is.na(datos))

#variable de compras
datos.compra = datos[,86] #pasamos los datos de Purchase

#las otras columnas las pasamos a un ds nuevo
datos.estandarizados = scale(datos[,-86]) # no contiene la columna Purchase
head(datos.estandarizados)

#creamos un arreglo de filas 1:1000 para usarla como separador de los datos
# de prueba y de entrenamiento en ambos grupos: estandarizados y compra 
filas = 1:100

pruebas.datos = datos.estandarizados[filas,] #primero 1000
pruebas.compra = datos.compra[filas]  #Purchase primero 1000

# el resto de los 1000 van a entrenamiento
entrenamiento.datos = datos.estandarizados[-filas,] #el resto 1001...
entrenamiento.compra = datos.compra[-filas] #purchase el resto 1001 ...

#estableciendo el modelo
library(class)
set.send(90) # el margen

#obtenemos las predicciones de compra
#aplicamos pra K= 1, osea un vecimo proximo
prediccion.compra = knn(entrenamiento.datos, pruebas.datos, entrenamiento.compra, k=1)

#calculo del error
error = mean(pruebas.compra != prediccion.compra)
error #11% de error para k= 1

##
prediccion.compra = knn(entrenamiento.datos, pruebas.datos, entrenamiento.compra, k=5)

#calculo del error
error = mean(pruebas.compra != prediccion.compra)
error # 6% de error para k= 5

#para obtener el k-optimo hacemos un recorrido 1:20 para ver cual es el optimo
for (i in 1:20) {
  set.seed(90)
  prediccion.compra = knn(entrenamiento.datos, pruebas.datos, entrenamiento.compra, k=i)
  error[i] = mean(pruebas.compra != prediccion.compra)
}

#hacemos una tabla para presentar los errores encontrados
valores.k = 1:20
tabla.errores = data.frame(valores.k, error)
tabla.errores

