initAllNames<-function(matches){
  nameList<-unique(c(unique(as.character(matches[,11])), unique(as.character(matches[,21]))))
  nameList<-as.data.frame(nameList)
  nameList$rating<-rep(2.500, nrow(nameList))
  return(nameList)
}
