genus = rep("Solanum", 10)
species=c("chacoense", "chacoense", "chacoense", "chacoense", "chacoense", 
          "acaule", "acaule", "brevicaule", "acaule", "acaule")
locnotes=paste("locnote", 1:10)
minorarea=sample(c("area1", "area2", "area3", "area4"), size = 10, replace = TRUE)
majorarea=sample(c("marea1", "marea2"), size = 10, replace = TRUE)
country=sample(c("Peru", "Bolivia"), size = 10, replace = TRUE)
latitude = paste(1:10,"\u00B0",21:30,"'",45:54,"\"N", sep="")
longitude= paste(1:10,"\u00B0",11:20,"'",31:40,"\"E", sep="")
altitude = paste(2101:2110,"m")
colldate = paste(1:10,"Apr",1991:2000)
phenology=rep("fr",10)
collcite = c("Ochoa", "Ochoa & Salas","Ochoa et al.","Spooner","Anonymous",
             "Ochoa", "Ochoa & Salas","Ochoa et al.","Spooner","Anonymous"
             )
number   = as.character(sample(100:200, size = 10, replace=TRUE))
dups = sample(c("K", "C", "K, C", ""), size = 10, replace = TRUE)

record = cbind(genus, species, locnotes, latitude, longitude, altitude, 
               minorarea, majorarea, country,
               colldate, phenology, collcite, number,
               dups)
record = as.data.frame(record, stringsAsFactors = FALSE)


format.specs = as.data.frame(cbind(
  field = c("locnotes", "latitude", "longitude", "altitude", "colldate", "collcite", "number", "dups" ),
  style = c("none",     "none",     "none",      "none",     "none" ,   "italic",   "italic", "()"),
  sept  = c(", "  ,     ", "  ,     ", "  ,       ", ",       ", "     ," ",          " ",      ";"   )
), stringsAsFactors = FALSE)



context("Exsic new: format record")
expect_that( format.exsic.rec() == "", is_true())
expect_that( format.exsic.rec("") == "", is_true())
expect_that( format.exsic.rec() == "", is_true())
expect_that( format.exsic.rec(record[1,c("locnotes")]) 
             == "", is_true())
expect_that( format.exsic.rec(record[1,c("altitude")]) 
             == "", is_true())
expect_that( format.exsic.rec(record[1,c("latitude")]) 
             == "", is_true())

# expect_that( format.exsic.rec(record[1,c("locnotes", "altitude")], format.specs) 
#              == "locnote 1, 2101 m;", is_true())
# expect_that( format.exsic.rec(record[1,c("locnotes","altitude","colldate")]) 
#              == "locnote 1, 2101 m, 1 Apr 1991;", is_true())
# expect_that( format.exsic.rec(record[1,c("locnotes","altitude","colldate", "collcite")])  
#               ==  "locnote 1, 2101 m, 1 Apr 1991, *Ochoa*;", is_true())
# 
# expect_that( format.exsic.rec(record[1,c("locnotes","altitude","colldate", "collcite")])  
#              == "locnote 1, 2101 m, 1 Apr 1991, *Ochoa*;", is_true())
# 
# expect_that( format.exsic.rec(record[1,c("locnotes", "collcite")])  
#              == "locnote 1, *Ochoa*;", is_true())


