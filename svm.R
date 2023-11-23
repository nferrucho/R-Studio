#Maquinas de vectores de soporte

"
algoritmos de aprendizaje supervisado para resolver problemas de clasificacion

1. etiquetar clases
2. construir modelos y entrenar un SMV de prediga la clase
3. generacion de espacios para representar las classes separadas"

library(ISLR)
datos = iris
str(datos)

install.packages('e1071')
library(e1071)
help('svm') #suport vector machine

#intalcion del modelo; columna a predicir Species
#vamos a usar datos <- iris para desarrollar la prueba
modelo = svm(Species ~ ., data = datos)

#vemos las predicciones para cada una de las filas
predicciones = predict(modelo, datos[1:4])
predicciones

#en una tabla los datos son mas claros
tabla = data.frame(datos, predicciones)
tabla