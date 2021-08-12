library(here)
here()
filestoread=list.files("data", full.names = TRUE)
list_dv=lapply(filestoread, read.csv, header=TRUE)
nombres=gsub(".csv", "", list.files("data"))
names(list_dv)=nombres

for (i in nombres){list_dv[[i]]$origin_DB=i}
table_form=do.call(rbind, list_dv)
