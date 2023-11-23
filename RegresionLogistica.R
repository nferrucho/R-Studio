# regresion logistica
"
 matriz de confusion:
 permite evaluar el modelo de regresion logistica
 PC=positivos correctos     NC=negativos correctos 
 FP= falsos positivos       FN=falsos negativos
 
 Precision
 precision = (PC + NC) /total
 
 tasa de error
 tasaErros = (FP + FN) /total
" 
datos = read.csv('titanic.csv')
library (ggplot2)

#vemos la distribucion de sobrevivientes
ggplot(datos,aes(Survived)) + geom_bar()
#sobreviviente fue menor a los desaparecidos 

# factorizado por variable Pclass
ggplot(datos,aes(Pclass)) + geom_bar(aes(fill=factor(Pclass)))
ggplot(datos,aes(Sex)) + geom_bar(aes(fill=factor(Sex)))
#la problacion es mas de hombres

#histograma por edad
ggplot(datos,aes(Age)) + geom_histogram(bins=20, alpha= 0.5,fill='green')
# la poblacion esta entre los 20 y 30 años

#relacion poblacion clase y edad
grafico = ggplot(datos, aes(Pclass, Age)) # definicion del plano
grafico = grafico + geom_boxplot(aes(group = Pclass, fill= factor(Pclass), alpha= 0.5))
print(grafico)
# la clase 3 tiene ente 20 años a mas poblacion 
# la clase 1 tiene mas distribucion de edad 30 a 60 años

#LIMPIEZA DE DATOS
#-----------------
#revision de valores nulos
install.packages('Amelia', dependencies = TRUE)
library(Amelia)

#validacion de valores en un dataset
missmap(datos, main='valores nulos', col= c('red','blue'))

#correccion de nulos al campo Age de acuerdo a Pclass
#creamos una funcion para ajustar los datos

edad = function(edad, clase){
  salida = edad
  for (i in 1:length(edad)){ #rango 1:length(edad)
    if (is.na(edad[i])){
      if (clase[i] == 1)
        salida[i] = 38
      else if(clase[i] == 2)
        salida[i] = 29
      else
        salida[i] = 23
    }else 
      salida[i] = edad[i]
  }
  return(salida)
}

edades = edad(datos$Age, datos$Pclass)
datos$Age = edades

#revisamos el ajuste
missmap(datos, main='valores nulos', col= c('red','blue'))

# GENERACION DEL MODELO
# eliminaos los campos que no requerimos
library(dplyr)

# eliminar los campos con -
datos = select(datos, -PassengerId, -Name, -Ticket, -Cabin)
head(datos)

#factorizacion de columnas para pasarlas a valores enteros
datos$Survived = factor(datos$Survived) 
datos$Pclass =  factor(datos$Pclas)
Datos$SibSp = factor(Datos$SibSp)
datos$Parch = facor(datos$Parch)
str(datos)

#separamos los datos de pruebas y los de entrenamiento
library(caTools)
set.seed(90)
#datos para pruebas y para entrenamiento, variable Survived a probar
division = sample.split(datos$Survived, SplitRatio = 0.7)
entrenamiento = subset(datos, division ==TRUE)
pruebas = subset(datos, division == FALSE)

#modelo
                 
modelo = glm(Survived ~ . , family = binomial(link= 'logit'), data=entrenamiento)
summary(modelo)
"
las columnas para realizar el modelo son 

Pclass2      -1.298564   0.374819  -3.465 0.000531 ***
Pclass3      -2.547949   0.373834  -6.816 9.38e-12 ***
Sexmale      -2.697577   0.249881 -10.795  < 2e-16 ***
Age          -0.051924   0.010457  -4.965 6.86e-07 ***
"
#obtener predicciones
#las realizamos sobre las pruebas, que son el 30% de los datos, frente a modelo
predicciones = predict (modelo, pruebas, type='response')
head(predicciones)
"
como hablamos de una regresion logistica los valores o son 1 o son 0
debemos hacer ajuste a los datos > 0.5 ,1, 0
esto lo hacemos porque Survived los factorizamos a 1 o 0
"
resultados = ifelse(predicciones > 0.5, 1, 0)
head(resultados)

#evaluacion de precision del modelo, calculamos la tasa de error
#valoramos los resultado frente alos valores de la parte de pruebas
error = mean(resultados != pruebas$Survived)
error

precision = 1- error
precision # precisin del 80%
