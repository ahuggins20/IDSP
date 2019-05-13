changeRatings<-function(match, ratings){
  actPct<-pctGamesWon(match,ratings)#Data frame containing names and pct for each player
  expPct<-calcExpectedPct(as.character(match$winner_name),as.character(match$loser_name),ratings)
  isUpset<-ratings[ratings$nameList==as.character(match$loser_name),2]>ratings[ratings$nameList==as.character(match$winner_name),2]
  if(isUpset==TRUE){
    expWinName<-as.character(match$loser_name)
  }else{
    expWinName<-as.character(match$winner_name)
  }
  actPctOfExpWin<-as.numeric(as.character(actPct[actPct$name==expWinName,2]))
  changeInRatings<-as.numeric(actPctOfExpWin-expPct)
  return(c(changeInRatings,isUpset))
}
