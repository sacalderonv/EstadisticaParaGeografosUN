# Descriptiva Espacio-Tiempo ----

library(rgdal)
library(sp)
TCEQ<-readOGR("TCEQ_Air_Monitoring_Sites_PR_studyregion.shp", layer="TCEQ_Air_Monitoring_Sites_PR_studyregion")
#sf::st_read("TCEQ_Air_Monitoring_Sites_PR_studyregion.shp")

## Gráfico de los sitios de las ubicaciones para el monitoreo del aire----
plot(TCEQ, main="Spatial distribution of air monitoring sites
in Texas")

TCEQ_coords <- as.data.frame(coordinates(TCEQ))
View(TCEQ_coords)

## Se calcula la media espacial (x,y) usando: ----
TCEQ_X_MEAN <- mean(TCEQ_coords$coords.x1); TCEQ_X_MEAN
TCEQ_Y_MEAN <- mean(TCEQ_coords$coords.x2); TCEQ_Y_MEAN

## Se calcula la mediana espacial (x,y) usando:----
TCEQ_X_MED <- median(TCEQ_coords$coords.x1); TCEQ_X_MED
TCEQ_Y_MED <- median(TCEQ_coords$coords.x2); TCEQ_Y_MED

## Vamos ahora a calcular y dibujar la desviación de distancia estándar(SDD) y la elipse de desviación estándar (SDE)

library(aspace)
a_sdd<-aspace::calc_sdd(id=1, centre.xy=NULL, calccentre=TRUE,weighted=FALSE, weights=NULL, points= TCEQ_coords, verbose=FALSE)
a_sdd$ATTRIBUTES
a_sde<-aspace::calc_sde(id=1,points= TCEQ_coords)
a_sde$ATTRIBUTES

aspace::plot_sdd(datin=a_sdd, plotcentre=FALSE, plotnew = TRUE,centre.col="red",
                 centre.pch="1", sdd.col="red",sdd.lwd=1,titletxt="",
                 plotpoints =TRUE,points.col="black")

aspace::plot_sde(datin=a_sde, plotcentre=FALSE ,plotnew = FALSE,centre.col="red",
                 centre.pch="1", sde.col="red",sde.lwd=1,titletxt="",
                 plotpoints=TRUE,points.col="black")

points(TCEQ_X_MEAN,TCEQ_Y_MEAN,pch=22,col="blue")
points(TCEQ_X_MED,TCEQ_Y_MED,pch=23,col="blue")

### Se puede concluir que los sitios de monitoreo del aire siguen una dirección de noroeste a sureste.
###Hay más sitios en el sureste, y las grandes desviaciones estándar a lo largo de los ejes x e y sugieren una amplia dispersión



# Estadística Descriptiva para Series de Tiempo ----

## Visualización de las series de Tiempo ----
library(readxl)
library(tidyverse)
library(zoo)
library(xts)
library(TSstudio)
##Se debe especificar el directorio de trabajo.
DesempleoyEmpleo <- read_excel("DesempleoyEmpleo.xlsx", range="A6:C269")
str(DesempleoyEmpleo)
DesempleoyEmpleo_1=DesempleoyEmpleo %>% map_df(rev)
tail(DesempleoyEmpleo)
head(DesempleoyEmpleo_1)
###Conversión a un objeto de serie de tiempo ----

Fechas=as.yearmon(DesempleoyEmpleo_1$Fecha)
Desempleo_Col_xts=xts(x = DesempleoyEmpleo_1$Tasa_de_desempleo,frequency = 12,order.by = Fechas)
ts_info(Desempleo_Col_xts)
plot(Desempleo_Col_xts)

## Descomposición Usando Fitro de Promedios móviles##
Desempleo_Col_ts<-as.ts(Desempleo_Col_xts)
Desempleo_Col_ts.decomp<-decompose(Desempleo_Col_ts)
plot(Desempleo_Col_ts.decomp)



###Pasajeros

AirPassengers <- read.csv("~/Documents/GitHub/EstadisticaParaGeografos/EstadisticaParaGeografosUN/Espacio_Tiempo/AirPassengers.csv")
AirPassengers$Month
###
AirPassengers_ts<-ts(AirPassengers$NPassengers,start = c(1949,01),frequency = 12)
AirPassengers_ts
str(AirPassengers_ts)
ts_info(AirPassengers_ts)
plot(AirPassengers_ts)
###Descomposición ----

AirPassengers_ts.decomp<-decompose(AirPassengers_ts)
plot(AirPassengers_ts.decomp)

