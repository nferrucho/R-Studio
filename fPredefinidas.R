#funciones predefinidas
#secuencia 
seq(1,10)

#sort
vector = c(34,5,6,7,3,3,2,2,1)
sort(vector)

#rev -> reversa al vector
rev(sort(vector))

#str -> estructura de un objeto
str(mtcars)

#summary -> resumen estadistico
summary (mtcars)

#append --> une vectores
v1 = c(3,4,5,6,7,7)
v2 = c(3,4,5,6,7,8)
v3= append(v1,v2)
v3

#is. -> numeric, matriz, vector, revisa el tipo de objeto

#as. -> convierte en .matriz . vector, 

#sapply -> aplica sobre un vector una operacion de una funcion personal
v1 = c(3,4,5,2)

suma = function (numero)
   #sample: genera numeros aleatorios -> retorna 1
   return (sum(numero + sample(1:100,1)))

v2 = sapply(v1, suma)
v2

#sapply en funcion anonima
# la funcion esta generada sin nombre detro del parametro sapply
v1 = c(2,4,5,6,6,7,7)
v2 = sapply(v1,function(numero){numero +10})
v2

#lapply -> aplica para listas

#grepl -> busca una palabra en una cadena de texto
grepl ('hola', 'Vamos a ganar ')

#grep -> elementos en un vector, retorna la posicion 
grep (4, c(34,5,6,6,76,4)) # indica la posicion donde esta el valor
grepl (4, c(34,5,6,6,76,4)) #indica TRUE o FALSE en que posicion esta un valor

#Sys.Date() -> convierte a tipo fecha
fecha = Sys.Date()
fecha

#as.Date (fecha) -> convierte a date la variable
as.Date('2023-12-10')

#Sys.Time() -> obtiene la hora
#format aplica para formato fecha y hora
hora= format(Sys.time(),format="%H:%m")
hora



