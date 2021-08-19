library(stringi)
library(readxl)
library(here)

primer_filtro <- read_excel("~/PhD/Douda/mis articulos/lasidia review/primer filtro.xlsx")
here()
segundo_filtro=primer_filtro[-which(stri_duplicated(primer_filtro$Title)==TRUE),]
segundo_filtro$Title[-which(stri_duplicated(segundo_filtro$Title)==TRUE)]
write.csv(segundo_filtro, "data/segundo_filtro.csv")
