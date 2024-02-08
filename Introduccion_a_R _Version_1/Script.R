# Objetos de R====

###En R existen diferentes tipos de objetos,
###y dependiendo de las necesidades se hace importante
###aprender a manejarlas. A continuación presentamos los
### Objetos mas usados.
##A los objetos se les puede aplicar funciones de R
##las cuales permiten obtener información de tales objetos
## o transformarlos.
## Vector Atómico====
####Un vector atómico no es mas que un vector de datos.

## Vectores----

# La estructura de datos mas simple es el vector numérico.
###Se crea de la siguiente forma usando = o <- que se le conoce como asignación.

x_num=c(1,3,5,7,9)
x_num
y_num<-c(1,3,5,7,9)
str(x_num) ##Muestra la estructura del objeto de forma compacta. str es una función del paquete base de R.
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
y_carac=c("T1","T2","T3","T4","T5")

## Accesando a los objetos====
## Podemos accesar a los elementos que conforma el vector de la siguiente forma
x_carac
x_carac[4]

y_carac[4]

y_carac[2:4]

## Operaciones básicas entre vectores numéricos====
### Adición----
####Los vectores deben tener mas mismas dimensiones
X_num=c(1,2,3)
Y_num=c(1,-1,2)
Z_num=X_num+Y_num
W_num=X_num-Y_num
### Producto====
###Dependiendo la necesidad, hay mas de una forma de definir el producto
### de dos vectores. En este caso lo que se hace es una multiplicación componente a
###a componente.
X_num*Y_num
### Chequear dimensiones----
length(X_num)
dim(X_num) ##dim es para matrices.


Z=c(9,7,0,-3,"estadística","geografía",5.76)
class(Z)
str(Z)
Z


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
##Usted puede acceder a cualquier elemento de la lista como sigue:
Lista2$nombres
Lista2$ubicaciones

Lista2$Localidad
Lista2$Edad

Lista2[[4]]
## Data Frames y ahora tibbles====
###Los data frames(marcos de datos) son la versión bidimensional de una lista. 
###Son, por mucho, la estructura de almacenamiento más útil para el 
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
####Tarea:Crear un nuevo dataframe que incluya además de las variables anteriores
###las dos variables adicionales de la Lista2, la latitud y longitud.
### Con base en el dataframe df_1, crear dos nuevas columas con las latitudes y longitudes de la Lista2.
###También añadir un registro adicional(Consultar como se hace?)

###Tarea: Crear un data frame con al menos 10 registros, donde cada registro corresponde a
### una chasa en donde se registra o mide la ubicación(latitud, longitud), el nombre, el producto principal de venta("golosina", "comida fresca"), y el número de ventas en un periodo del 10 minutos.


### Accediendo a elementos de un dataframe----

#Se puede acceder primariamente a los elementos de un dataframe
#es decir a las columnas de dataframe o variables medidas. Esto se hace 
#análogamente a como se hizo con las listas.
df_1$Nombres ##Se accede a la variable a columna Nombres
df_1$Localidad

mean(df_1$Edad)
sd(df_1$Edad)
table(df_1$Localidad)
table(df_1$Localidad,df_1$Nombres). #Tabla de contingencia
## Tibbles ----
#Los tibbles, como antes se indicó son una evolución del dataframe
#a estructuras de datos que permitan la manipulación y el análisis de forma
#un poco mas fácil. Los tibbles trabajan en el entorno de tidyverse
# el cual es un paquete de R. Antes de hablar de tibbles, veámos comos e instala un
# un paquete que no viene pre-instalado o no se ha instalado con anterioridad.

# Hay varias formas de instalar un paquete en R, aquí trataremos las
#dos formas mas comunes: 
### Instalación mediante un orden o una función----
##Para esto se requiere el nombre exacto.
install.packages("tidyverse") ###Esto puede tardar bastante.
##tibble es un paquete que hace parte del entorno tidyverse
#Una vez instalado el paquete o núcleo procede a cargar o llamar el paquete para que esté disponible.
##Se hace con la función library().
library(tidyverse)

# Una vez instalado y cargado el paquete podemos empezar a usarlo.

#La forma fácil de crear un objeto tibble, consiste en usar directamente un dataframe
# Viste el siguiente enlace para mas detalles \url{https://r4ds.had.co.nz/tibbles.html}
tbl_df1=tibble::as_tibble(df_1)

### Tarea ----
# Use el conjunto de datos iris haciendolo activos mediante data("iris")
data("iris")
iris
# Crear un objeto tibble de ese conjunto
# Explore el archivo y obtenga estadísticas 
##básicas de las variables nuuméricas y tablas
tbl_iris<-as_tibble(iris)

## También se puede crear un objeto tibble como se hizo el dataframe
tbl_lista<-tibble::tibble(nombres=c("Andres","Camila","Pedro","Sandra"),Edad=c(19,21,18,20),Localidad=c("Teusaquillo","Suba","Chapinero","Kennedy"),latitud=c(4.6188864,4.706369089343199,4.618767017331927,4.632883977507037), longitud=c(-74.1354241, -74.0412070354434, -74.08648338089243, -74.11558088496801))
tbl_lista


###Trabajando con objeto tibble ----
#### Operador Pipe
# Los Pipes son una herramienta poderosa para expresar claramente una secuencia de múltiples operaciones.
# El operador Pipe mas usado es %>% o |> disponible en versiones de R a partir de la 4.1

### Ejemplo de Operaciones----
#### Selección de Variables----
tbl_lista|>select(nombres)
tbl_lista|>select(Localidad)

#### Agrupamientos----
tbl_lista|>group_by(Localidad)
Grupos_iris<-tbl_iris|>group_by(Species)
##Revise la salida en la ventana de objetos


# Importación de datos externos----
#Dependiendo del tipo de archivo donde tenemos nuestros datos, el cual está externos a R, se require de diferentes funciones 
#para poder importarlos a R y así poder trabajar con ellos.
# El formato de texto mas usual en donde tenemos los datos es un archivo de excel con extensión .xlsx, sin embargo podemos
#tenerlos en diferentes formatos, por ejemplo archivo plano .cvs, .txt, .dat etc u otro formato que provenga de un ciertos tipos de programas
#SAS, SPSS etc.

# La forma mas fácil de hacerlo es mediante la herramienta de importación de Rstudio que se accede por 
# medio File>>Import Dataset>> y se selecciona le tipo de archivo que tenemos.


# Vamos a importar un archivo que se encunetra en el repositorio llamado Pesos_Alturas_Diametros.xlsx que se encuentra en la carpeta 
##Estadística descriptiva. En mi caso me genera el siguiente código y un objeto en R llamado Pesos_Alturas_Diametros, el cual tiene
## mi datos importados cpon la estructura que necesito.
### library(readxl)
### Pesos_Alturas_Diametros <- read_excel("Documents/GitHub/EstadisticaParaGeografosUN/Estadistica_Descriptiva/Pesos_Alturas_Diametros.xlsx")

Pesos_Alturas_Diametros

# Con este objeto podemos trabajar tal cual lo hemos hecho con los objetos creados directamente desde R.

##Tarea: prácticar lo visto en clase con el objeto importado Pesos_Alturas_Diametros, tenga en cuenta de primero verificar 
#que tipo de objeto es. 

