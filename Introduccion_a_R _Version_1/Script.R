# Objetos de R====

###En R existen diferentes tipos de objetos,
###y dependiendo de las necesidades se hace importante
###aprender a mnejarlas. A continuación presentamos los
### Objetos mas usados.
##A los objetos se les puede aplicar funciones de R
##las cuales permiten obtener información de tales objetos
## o transformarlos.
## Vector Atómico====
####Un vector atómico no es mas que un vector de datos.

## Vectores----

# La estructura de datos mas simple es el el vector numérico.
###Se crea de la siguiente forma usando = o <- que se le conoce como asignación.

x_num=c(1,3,5,7,9)
x_num<-c(1,3,5,7,9)
str(x_num) ##Muestra la estructura del obejto de forma compacta.
class(x_num)
typeof(x_num)
##En Rstudio se pueden ver los objetos creados en la ventana derecha arriba por defecto
## También se puede consultar ayuda de las funciones como sigue:
?class

###También se puede usar la ventana de la derecha
## Números----
#Un número es considerado un vector de una dimensión
num_num<-9.8
y_num=c(x_num,num_num)
y_num
pi
## Vector de Caracteres====
x_carac<-c("Rojo","Verde","Azul")
class(x_carac)
str(x_carac)


## Accesando a los objetos====
## Podemos accesar a los elementos que conforma el vector de la siguiente forma
x_carac
x_carac[1]

## Operaciones básicas entre vectores numéricos====
### Adición----
####Los vectores deben tener mas mismas dimensiones
X_num=c(1,2,3)
Y_num=c(1,-1,2)
Z_num=X_num+Y_num

### Producto====
###Dependiendo la necesidad, hay mas de una forma de definir el producto
### de dos vectores. En este caso lo que se hace es una multiplicación componente a
###a componente.
X_num*Y_num
### Chequear dimensiones----
length(X_num)
dim(X_num). ##dim es para matrices.







## Listas====
###Las listas son vectores atómicos que permiten tener
### Diversos tipos de datos
Lista1<-list("A",c(1,2,3),matrix(c(1,2,3,4),2,2))
Lista1
class(Lista1)
typeof(Lista1)
str(Lista1)

Lista2<-list(nombres=c("Andres","Camila","Pedro","Sandra"),Edad=c(19,21,18,20),Localidad=c("Teusaquillo","Suba","Chapinero","Kennedy"),ubicaciones=matrix(c(4.6188864,4.706369089343199,4.618767017331927,4.632883977507037, -74.1354241, -74.0412070354434, -74.08648338089243, -74.11558088496801),4,2))
Lista2
str(Lista2)
##Usted puede acceder a cualquier elememento de la lista como sigue:
Lista2$nombres
Lista2$ubicaciones

## Data Frames y ahora tibbles====
###Los data frames(marcos de datos) son la versión bidimensional de una lista. 
###Son, con mucho, la estructura de almacenamiento más útil para el 
###análisis de datos y proporcionan una forma ideal de almacenar un registro completo de datos.
### Un tibble, o tbl_df, es una reinvención moderna del data.frame, manteniendo el tiempo 
### que ha demostrado ser efectivo y descartando lo que no lo es. 
###Los Tibbles son data frames que son perezosos y hoscos: 
###hacen menos (es decir, no cambian los nombres o tipos de variables,
###y no hacen coincidencias parciales) y se quejan más 
###(por ejemplo, cuando una variable no existe). Esto lo obliga a enfrentar 
###los problemas antes, lo que generalmente conduce a un código más limpio y expresivo.


###Ejemplo
###Vamos a crear a data frame con las tres primeras entradas 
###del objeto Lista2, donde cada Columna hace referencia a una variable
###Medida a un cierto individuo.

df_1=data.frame(Nombres=Lista2$nombres,Edad=Lista2$Edad,Localidad=Lista2$Localidad)
df_1
class(df_1)
str(df_1)
typeof(df_1)
##Cada fila corresponde a un registro de medición de cada variable que está ubicada por columna
####Tarea:Crear un nuevo data frame que incluya además de las variables anteriores
###las dos variables adicionales la latitud y longitud. 

###Tarea: Crear un data frame con al menos 10 registros, donde cada registro corresponde a
### una chasa en donde se registra o mide la ubicación(latitud, longitud), el nombre, el producto principal de venta("golosina", "comida fresca"), y el número de ventas en un periodo del 10 minutos.
