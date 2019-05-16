initAllNames<-function(matches){
  nameList<-unique(c(unique(as.character(matches$winner_name)), unique(as.character(matches$loser_name))))
  nameList<-as.data.frame(nameList)
  nameList$rating<-rep(2.500, nrow(nameList))
  return(nameList)
}
