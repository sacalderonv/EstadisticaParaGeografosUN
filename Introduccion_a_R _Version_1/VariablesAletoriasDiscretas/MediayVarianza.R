##Aquí se calcula la media y la varianza poblacionales del ejemplo----
media1=0.15*0 + 0.35*1 + 0.30*2 + 0.15*3 +0.05*4
media2= 0.20*0+ 0.20*1 + 0.30*2 + 0.15*3 +0.15*4
varianza1=0.15*(0-media1)^2 + 0.35*(1-media1)^2 + 0.30*(2-media1)^2 + 0.15*(3-media1)^2 +0.05*(4-media1)^2
varianza2=0.15*(0-media2)^2 + 0.35*(1-media2)^2 + 0.30*(2-media2)^2 + 0.15*(3-media2)^2 +0.05*(4-media2)^2

###
media1
media2
varianza1
varianza2
 ####Note que la población 2 tiene mayor varianza.

## Otra forma de calcularlos es como sigue:
x=c(0,1,2,3,4)
p_x=c(0.15,0.35,0.3,0.15,0.05)
media_1=sum(x*p_x)
varianza_1=sum(((x-media_1)^2)*p_x)
media_1
varianza_1

##Gráfico de la función de distribución ----

plot(x,p_x,type = "h")

###Creando la acumulada
F_x=cumsum(c(0,p_x))
###Gráfico Acumulada ====
plot(stepfun(x,F_x),main="Distribución Acumulada")
