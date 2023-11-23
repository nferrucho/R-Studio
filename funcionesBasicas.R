
install.packages("dplyr")
library(dplyr)
datos = mtcars
head(datos)

#filter - filtro a una columnas ==
filter(datos, mpg== 21.0, vs== 0)

#slice - toma una parte de filas
slice(datos, 13:15)

#arrange - orderna por un conjunto unas columnas
arrange(datos, mpg, hp,wt)
arrange(datos, desc(drat), mpg)

#select -> solo toma las columnas seleccionadas
select(datos, mpg, hp,qsec)

#rename -> renmbra columnas
rename (datos, millas = mpg)

#distinct --> valores unicos de una variable
distinct (select(datos, mpg))

#media de una columna
#no tiene encuenta los vacio
summarise(datos, media = mean (mpg, na.rm = TRUE))

#mostrar datos aleatorios del dataset
sample_n(datos, 20)

#seleccionando descente de mpg, con aletoriedad 5 filas donde mpg > 20 
resultado = arrange(sample_n(filter(datos,mpg >20), size=5),desc(mpg))
resultado

#unir varias columnas
library(tidyr)
library(data.table)

#gather -- tranforma columnas a filas en un dataset
#spread -- tranforma filas a columnas en un dataset
#separate -- separa una columna e 2 

datos = data.frame(columna=c('1,2', '3,4','1,9'))
datos
datos = separate(datos, columna, c('c1', 'c2'))
datos

#unite -- une 2 columnas por un char
datos = unite(datos, columna, c1,c2,sep='*')
datos


