initAllNames<-function(matches){
  #Gets all unique names from all matches played
  nameList<-unique(c(unique(as.character(matches$winner_name)), unique(as.character(matches$loser_name))))
  nameList<-as.data.frame(nameList)
  nameList$rating<-rep(2.500, nrow(nameList))
  #Sets all ratings for all players to 2.5
  return(nameList)
}
