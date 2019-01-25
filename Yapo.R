##########################################################
###################### PROYECTO YAPO #####################
##########################################################

# Usando la librería rvest
library('rvest')

# Usando la libreria ggplot2
library('ggplot2')

# Abrir CSV
if(file.exists("fileTextoYFreqYapo.txt")){
  print("Abre CSV")
  fileTextoYFreqYapo <- read.table(file = "fileTextoYFreqYapo.txt", header = TRUE, sep = " ")
}

#========================================================================#

# Se analizará como prueba con la primera página

# Asignación de una variable a la URL de la página
paginaYapo <- 'https://www.yapo.cl/region_metropolitana?ca=15_s&o=1'

# Lectura de HTML como variable paginaYapo
webpageYapo <- read_html(paginaYapo)

# Extracción del texto contenido en la clase categoría de la web
contenidoYapo <- html_nodes(webpageYapo,'.category')

# Viendo el contenido de la variable contenidoYapo
print(contenidoYapo)

# Extrayendo el texto de contenidoYapo
textoYapo <- html_text(contenidoYapo)

# Viendo el contenido de la variable textoYapo
print(textoYapo)

# Contando palabras
unlistTextoYapo <- unlist(textoYapo)
tablaTextoYapo <- table(unlistTextoYapo)

# Transformando a data framtabla
contaYapo <- as.data.frame(tablaTextoYapo)

# Se trabajará para las primeras 100 páginas de la web

# Se crea una lista
todosLasCategorias <- list()

# Recorriendo las páginas y obteniendo el dato de la clase
for(i in 1:100){
  print(paste("https://www.yapo.cl/region_metropolitana?ca=15_s&o=",i,sep = ""))
  
  paginaDescargada <- read_html(paste("https://www.yapo.cl/region_metropolitana?ca=15_s&o=",i,sep = ""))
  contenidoYapo <- html_nodes(webpageYapo,'.category')
  texto <- html_text(contenidoYapo)
  todosLasCategorias <- c(todosLasCategorias,texto)
}

# Contando y pasando a dataframe
tablaTextoYapo <- table(unlist(todosLasCategorias))
dfTextoYFreqYapo <- as.data.frame(tablaTextoYapo)

# Uniendo dos dataframes por Var1 sumando frecuencias
if(exists("fileTextoYFreqYapo")){
  print("Uniendo los DataFrames")
  dfTextoYFreqYapo <- aggregate(cbind(Freq) ~ Var1, rbind(dfTextoYFreqYapo,dfTextoYFreqYapo), sum)
}

# Grafico de Barra de la información
dfTextoYFreqYapo %>%
  ggplot() +
  aes(x = Var1 , y = Freq) +
  geom_bar(stat="identity")

# Guardando información en txt
write.table(dfTextoYFreqYapo, file="fileTextoYFreqYapo.txt")

# Recolectando datos de Antofagasta
for(i in 1:100){
  print(paste("https://www.yapo.cl/antofagasta?ca=3_s&o=",i,sep = ""))
  
  paginaDescargada <- read_html(paste("https://www.yapo.cl/region_metropolitana?ca=15_s&o=",i,sep = ""))
  contenidoYapo <- html_nodes(webpageYapo,'.category')
  texto <- html_text(contenidoYapo)
  todosLasCategorias <- c(todosLasCategorias,texto)
}

# Contando y pasando a dataframe
tablaTextoYapo <- table(unlist(todosLasCategorias))
dfTextoYFreqYapo <- as.data.frame(tablaTextoYapo)

# Uniendo dos dataframes por Var1 sumando frecuencias
if(exists("fileTextoYFreqYapo")){
  print("Uniendo los DataFrames")
  dfTextoYFreqYapo <- aggregate(cbind(Freq) ~ Var1, rbind(dfTextoYFreqYapo,dfTextoYFreqYapo), sum)
}

#Grafico de Barra de la información
dfTextoYFreqYapo %>%
  ggplot() +
  aes(x = Var1 , y = Freq) +
  geom_bar(stat="identity")

# Recolectando datos de Los Lagos
  for(i in 1:100){
    print(paste("https://www.yapo.cl/los_lagos?ca=12_s&o=",i,sep = ""))
    
    paginaDescargada <- read_html(paste("https://www.yapo.cl/region_metropolitana?ca=15_s&o=",i,sep = ""))
    contenidoYapo <- html_nodes(webpageYapo,'.category')
    texto <- html_text(contenidoYapo)
    todosLasCategorias <- c(todosLasCategorias,texto)
  }

# Contando y pasando a dataframe
tablaTextoYapo <- table(unlist(todosLasCategorias))
dfTextoYFreqYapo <- as.data.frame(tablaTextoYapo)

# Uniendo dos dataframes por Var1 sumando frecuencias
if(exists("fileTextoYFreqYapo")){
  print("Uniendo los DataFrames")
  dfTextoYFreqYapo <- aggregate(cbind(Freq) ~ Var1, rbind(dfTextoYFreqYapo,dfTextoYFreqYapo), sum)
}

#Grafico de Barra de la información
dfTextoYFreqYapo %>%
  ggplot() +
  aes(x = Var1 , y = Freq) +
  geom_bar(stat="identity")
