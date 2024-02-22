###Permutaciones -----

library(DescTools)
?DescTools::Permn

factorial(4)/factorial(4-4)  ###Permutaciones
DescTools::Permn(seq(1,4),4)
x<-letters[1:5]
DescTools::Permn(x,4)


####Caombinaciones 
DescTools::CombN(43,5)  ###Combinaciones
choose(43,5)           ##Base de R
DescTools::CombN(4,4,ord = TRUE) ###Permutaciones

DescTools::CombSet(x,3)

###Muestras ordenadas de tamaño m, con reemplazo, de n Objetos n^m
###Acá se puede usar para la lotería o chance de 4 cifras
10^4
DescTools::CombN(10,4,repl=TRUE,ord = TRUE)
