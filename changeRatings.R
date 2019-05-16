changeRatings<-function(match, ratings){
  actPct<-pctGamesWon(match,ratings)
  #Gets the actual percentage from the match
  expPct<-calcExpectedPct(as.character(match$winner_name),as.character(match$loser_name),ratings)
  #Gets expected percentage from the rating of the two players
  isUpset<-ratings[ratings$nameList==as.character(match$loser_name),2]>ratings[ratings$nameList==as.character(match$winner_name),2]
  #Gets if it is an upset, winner rating < loser rating
  if(isUpset==TRUE){
    #Gets expected winner name using if it is an upset
    expWinName<-as.character(match$loser_name)
  }else{
    expWinName<-as.character(match$winner_name)
  }
  #Gets the actual percentage of games won for the expected winner
  actPctOfExpWin<-as.numeric(as.character(actPct[actPct$name==expWinName,2]))
  changeInRatings<-as.numeric(actPctOfExpWin-expPct)
  #Subtracts actual percentage of expected winner from expected percentage
  return(c(changeInRatings,isUpset))
  #returns the change of ratings and if it is an upset(important for main)
}
