library(data.table)

#set working directory
setwd('/Users/analutzky/Desktop/')


############################ PROFILS SOCIAUX ############################

# read French file of 2010-2019 high school students 
Table_lyceens=fread('/Users/analutzky/Desktop/profil_sociaux_terminales.csv')

# showing it excel-like
View(Table_lyceens)
# showing column names
colnames(Table_lyceens)
# put them into a variable
var.names=colnames(Table_lyceens)
### getting rid of space and special characters in columns names 
colnames(Table_lyceens)=make.names(var.names)
# showing column names
colnames(Table_lyceens)


# j'ai 3 soucis avec ma colonne Effectifs : 
# 1. j'avais mal écrit "effectifs" => j'ai réglé ça dans le gsub ie 'global substitute'
# 2. il y avait un séparateur de millier à enlever => gsub()
# 3. et R pensait que le type de la variable était une chaîne caractères et non un nombre => as.numeric()
Table_lyceens[,Effectifs:=as.numeric(gsub(" ","",Effectfifs))]

# Bon et puis j'avais une colonne nommée bêtement "c" à virer
Table_lyceens[,Effectfifs:=NULL]

# On y va pour le pourcentage des catégories sociales des lycéens par série de bac et par année
Table_lyceens = Table_lyceens[,Répartition:=Effectifs/sum(Effectifs)*100, by=.(Série,Année)]

# csv2 is for French csv (; as separator, and "," for decimals)
write.csv2(as.data.frame(Table_lyceens),file='Profils_sociaux_avec_repartition.csv',fileEncoding = "UTF8")


############################  GENRE ############################

# read French file of 2010-2019 high school students 
Table_lyceens_H_F=fread('/Users/analutzky/Desktop/genre_pour_R.csv')

# showing it excel-like
View(Table_lyceens_H_F)
# showing column names
colnames(Table_lyceens_H_F)
# put them into a variable
var.names=colnames(Table_lyceens_H_F)
### getting rid of space and special characters in columns names 
colnames(Table_lyceens_H_F)=make.names(var.names)
# showing column names
colnames(Table_lyceens_H_F)

# 2 soucis avec ma colonne Effectifs : 
# 2. il y avait un séparateur de millier à enlever => gsub()
# 3. et R pensait que le type de la variable était une chaîne caractères et non un nombre => as.numeric()
Table_lyceens_H_F[,Effectifs:=as.numeric(gsub(" ","",Effectifs))]

# Par ailleurs j'avais déjà créé une colonne nommée "Répartation" qu'il me fallait supprimer
Table_lyceens_H_F[,Répartition:=NULL]

# On y va pour le pourcentage du genre des lycéens par série de bac et par année
Table_lyceens_H_F = Table_lyceens_H_F[,Répartition:=Effectifs/sum(Effectifs)*100, by=.(Série,Année)]

# csv2 is for French csv (; as separator, and "," for decimals)
write.csv2(as.data.frame(Table_lyceens_H_F),file='Genre_avec_repartition.csv',fileEncoding = "UTF8")



############################  ETAT DES LIEUX GLOBAL ############################

# read French file of 2010-2019 high school students 
Table_lyceens_global=fread('/Users/analutzky/Desktop/global_pour_R.csv')

# showing it excel-like
View(Table_lyceens_global)
# showing column names
colnames(Table_lyceens_global)
# put them into a variable
var.names=colnames(Table_lyceens_global)
### getting rid of space and special characters in columns names 
colnames(Table_lyceens_global)=make.names(var.names)
# showing column names
colnames(Table_lyceens_global)

# On y va pour le pourcentage de série de bac des lycéens par année
Table_lyceens_global = Table_lyceens_global[,Répartition:=Effectifs/sum(Effectifs)*100, by=.(Année)]

# csv2 is for French csv (; as separator, and "," for decimals)
write.csv2(as.data.frame(Table_lyceens_global),file='Global_avec_repartition.csv',fileEncoding = "UTF8")
