library(here)
here()
filestoread=list.files("data", full.names = TRUE)
list_dv=lapply(filestoread, read.csv, header=TRUE)
nombres=gsub(".csv", "", list.files("data"))
names(list_dv)=nombres

for (i in nombres){list_dv[[i]]$origin_DB=i}
table_form=do.call(rbind, list_dv)

##ERASE COMPELTELY EMPTY COLUMNS NOTE LEAVES COLUMS THAT ARE "EMPTY" BUT IS NOT SIGNALED WITH A NA
table_form=table_form[,which(unlist(lapply(table_form, function(x)!all(is.na(x)))))]

write.csv(table_form, "data/TABLE_RAW.csv")
