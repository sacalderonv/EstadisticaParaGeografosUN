

library(readxl)
library(sf)
library(ggplot2)
help(st_read)

Municipios <- readRDS("Municipios.RDS")
Ocupados_ENH <- read_excel("Ocupados_ENH.xlsx", 
                                col_types = c("text", "text", "text", 
                                             "numeric", "numeric", "numeric"))

Media_Ing<-Ocupados_ENH%>%group_by(DPTO)%>%summarise(Media_Ing=mean(INGLABO))
Prop_Contrat.1<-Ocupados_ENH%>%group_by(DPTO,P6440)%>%summarise(n=n())%>%
  mutate(freq = n / sum(n))%>%filter(P6440=="1")%>%dplyr::select(DPTO,freq)%>%rename(freq.1="freq")
Prop_Contrat.2<-Ocupados_ENH%>%group_by(DPTO,P6440)%>%summarise(n=n())%>%
  mutate(freq = n / sum(n))%>%filter(P6440=="2")%>%dplyr::select(DPTO,freq)%>%rename(freq.2="freq")

Media_ING_Prop_Contract<-Media_Ing%>%left_join(Prop_Contrat.1,by=c("DPTO"="DPTO"))%>%left_join(Prop_Contrat.2,by=c("DPTO"="DPTO"))
deptos <- Municipios %>%
  group_by(Departamento,Dep) %>%
  summarise(Irural=sum(Poblacion*Irural)/sum(Poblacion)) %>%
  as.data.frame()
str(deptos)


deptoshp <- st_read("MGN_DPTO_POLITICO.shp",quiet=TRUE)
str(deptoshp)


mapdeptos <- deptoshp %>% left_join(deptos,by=c("DPTO_CCDGO"="Dep"))
str(mapdeptos)

mapdeptos_Ing_Prop <- deptoshp %>% left_join(Media_ING_Prop_Contract,by=c("DPTO_CCDGO"="DPTO"))
str(mapdeptos)



mundoshp <- st_read("admin00.shp",quiet=TRUE)
mundocol <- mundoshp %>% 
  filter(CNTRY_NAME %in% c("Peru","Brazil","Venezuela","Ecuador","Panama"))
str(mundocol)


help(geom_sf)
box <- st_bbox(mapdeptos)
box


ggplot() +
  geom_sf(data=mundocol) +
  geom_sf(data=mapdeptos,aes(fill=Irural),col="darkgray",linetype="solid") +
  coord_sf(xlim=c(box$xmin,box$xmax),ylim=c(box$ymin,box$ymax),expand=FALSE) +
  geom_sf_text(data=mapdeptos,aes(label=ifelse(Irural > 70,Departamento,"")),col="black",
               fontface="bold",size=4,fun.geometry=function(x) sf::st_centroid(x)) +
  labs(x="Longitud",y="Latitud",title="Colombia",fill="Índice de\nRuralidad") +
  scale_fill_gradient(low="white",high="red",n.breaks=5) +
  annotate("text", x=c(-74.5,-68,-78,-69,-78.5), y=c(-2.5,0,-1,9,9), colour="blue",
           label=c("Perú","Brasil","Ecuador","Venezuela","Panamá")) +
  theme(panel.background=element_rect(fill="lightblue"))


####Con Ingreso Laboral ----
ggplot() +
  geom_sf(data=mundocol) +
  geom_sf(data=mapdeptos_Ing_Prop,aes(fill=Media_Ing),col="darkgray",linetype="solid") +
  coord_sf(xlim=c(box$xmin,box$xmax),ylim=c(box$ymin,box$ymax),expand=FALSE) +
  geom_sf_text(data=mapdeptos_Ing_Prop,aes(label=ifelse(Media_Ing < 1300000,DPTO_CNMBR,"")),col="black",
               fontface="bold",size=4,fun.geometry=function(x) sf::st_centroid(x)) +
  labs(x="Longitud",y="Latitud",title="Colombia",fill="Ingreso promedio Laboral") +
  scale_fill_gradient(low="white",high="red",n.breaks=5) +
  annotate("text", x=c(-74.5,-68,-78,-69,-78.5), y=c(-2.5,0,-1,9,9), colour="blue",
           label=c("Perú","Brasil","Ecuador","Venezuela","Panamá")) +
  theme(panel.background=element_rect(fill="lightblue"))


####Con Proporción Contrato Laboral ----
ggplot() +
  geom_sf(data=mundocol) +
  geom_sf(data=mapdeptos_Ing_Prop,aes(fill=freq.1),col="darkgray",linetype="solid") +
  coord_sf(xlim=c(box$xmin,box$xmax),ylim=c(box$ymin,box$ymax),expand=FALSE) +
  geom_sf_text(data=mapdeptos_Ing_Prop,aes(label=ifelse(freq.1 > 0.5,DPTO_CNMBR,"")),col="black",
               fontface="bold",size=2,fun.geometry=function(x) sf::st_centroid(x)) +
  labs(x="Longitud",y="Latitud",title="Colombia",fill="Proporción Contrato Laboral") +
  scale_fill_gradient(low="white",high="red",n.breaks=5) +
  annotate("text", x=c(-74.5,-68,-78,-69,-78.5), y=c(-2.5,0,-1,9,9), colour="blue",
           label=c("Perú","Brasil","Ecuador","Venezuela","Panamá")) +
  theme(panel.background=element_rect(fill="lightblue"))


###Departamento Cundinamarca por municipios ----
mpioshp <- st_read("MGN_MPIO_POLITICO.shp",quiet=TRUE)
str(mpioshp)

cund <- mpioshp %>%
  left_join(Municipios,by=c("MPIO_CCNCT"="Depmun")) %>%
  filter(Dep=="25" | Dep=="11")
str(cund)

ggplot() +
  geom_sf(data=cund,aes(fill=Irural),col="darkgray",linetype="solid") +
  geom_sf_text(data=cund,aes(label=ifelse(Irural > quantile(Irural,0.95),Municipio,"")),col="black",
               fontface="bold",size=2,fun.geometry=function(x) sf::st_centroid(x)) +
  labs(x="Longitud",y="Latitud",title="Cundinamarca",fill="Índice de\nRuralidad") +
  scale_fill_gradient(low="white",high="red",n.breaks=5)


##Antioquia por Municipios ----
datos <- mpioshp %>%
  left_join(Municipios,by=c("MPIO_CCNCT"="Depmun")) %>%
  filter(Dep=="05")
Deps <- unique(datos$Departamento)

ggplot() +
  geom_sf(data=datos,aes(fill=Irural),col="darkgray",linetype="solid") +
  geom_sf_text(data=datos,aes(label=ifelse(Irural > quantile(Irural,0.95),Municipio,"")),col="black",
               fontface="bold",size=3.5,fun.geometry=function(x) sf::st_centroid(x)) +
  labs(x="Longitud",y="Latitud",title=ifelse(length(Deps)==1,Deps,paste0(Deps,collapse=" y ")),
       fill="Índice de\nRuralidad") +
  scale_fill_gradient(low="white",high="red",n.breaks=5)

#### LLano ----

Llano <- mpioshp %>%
  left_join(Municipios,by=c("MPIO_CCNCT"="Depmun")) %>%
  filter(Region=="Región Llano")
box <- st_bbox(Llano)

ggplot() +
  geom_sf(data=Llano,aes(fill=Irural),col="darkgray",linetype="solid") +
  geom_sf(data=deptoshp,alpha=0.1,col="black") +
  coord_sf(xlim=c(box$xmin,box$xmax),ylim=c(box$ymin,box$ymax),expand=FALSE) +
  geom_sf_text(data=Llano,aes(label=ifelse(Irural > 85,Municipio,"")),col="black",
               fontface="bold",size=3.5,fun.geometry=function(x) sf::st_centroid(x)) +
  labs(x="Longitud",y="Latitud",title="Región Llano",fill="Índice de\nRuralidad") +
  scale_fill_gradient(low="white",high="red",n.breaks=5)


###Boyacá Estaciones de Monitoreo Precipitación ----
library(stringr)
Estaciones <- read_excel("Estaciones.xlsx")
Estaciones <- within(Estaciones,Depmun <- stringr::str_sub(Depmun,1,5))
str(Estaciones)


poligonos <- mpioshp %>% filter(DPTO_CCDGO %in% c("15"))
Ests <- Estaciones %>% filter(str_sub(Depmun,1,2) %in% c("15"))
Deps <- unique(poligonos$DPTO_CNMBR)

ggplot(Ests) +
  geom_sf(data=poligonos,fill="orange",col="black",linetype="solid") +
  geom_point(aes(x=longitud,y=latitud,size=PRECIP),col="blue") + 
  scale_size(range=c(0,5)) +
  labs(x="Longitud",y="Latitud",title=ifelse(length(Deps)==1,Deps,paste0(Deps,collapse=" y ")),
       size="Precipitación") +
  coord_sf(default_crs = sf::st_crs(4326))



