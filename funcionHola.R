f1 <- function (nombre){
    cadena = paste('hola buenos dias',  nombre)
    print (cadena)  
}

f1('juan')
##
suma = function (x, y){
  z = x + y
  return (z)
}

z = suma(2,4)
print(z)
##
vector = c(2,3,4,5,6,1)
result = sum(vector)
print (result)

##
suma.matriz = function (matriz){
  suma = 0
  for (elemento in matriz){
    suma = suma + elemento
  }
  return (suma)
}

matriz = matrix(1:10,nrow=4,ncol=3)
print (matriz)

z = suma.matriz(matriz)
print (z)

