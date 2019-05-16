pctGamesWon<-function(match,ratings){
  #Gets the score
  specScore<-match$score
  #Splits score by set
  setScores<-strsplit(as.character(specScore),' ')
  #Splits score into games
  gamesPerSet<-lapply(setScores, function(i){
    strsplit(i,'-')
  })
  #Makes list into vector
  gameScores<-unlist(gamesPerSet, TRUE)
  #Only gets games(if there is a tiebreak score attached)
  gameScores<-lapply(gameScores, function(i){                                                                                                                                 
    substr(i,1,1)
    })
  #Converts number of games to numbers
  gameScores<-suppressWarnings(as.numeric(gameScores))
  #Removes NAs from retirement
  gameScores<-na.omit(gameScores)
  #Sums games to get total played, used in percentages
  totalPlayed<-sum(gameScores)
  #If match is walkover, gets expected percentages of games won by each player so that change is zero
  if(totalPlayed==0||is.na(totalPlayed)){
    pctWon<-calcExpectedPct(as.character(match$winner_name),as.character(match$loser_name),ratings)
    names<-rbind(as.character(match$winner_name),(as.character(match$loser_name)))
    #Checks if its an upset
    if(ratings[ratings$nameList==as.character(match$winner_name),2]>ratings[ratings$nameList==as.character(match$loser_name),2]){
      pcts<-rbind(pctWon,1-pctWon)
      out<-as.data.frame(cbind(names, pcts))
      colnames(out)<-c('name','pct')
      return(out)
    }else{
      pcts<-rbind(1-pctWon,pctWon)
      out<-as.data.frame(cbind(names, pcts))
      colnames(out)<-c('name','pct')
      return(out)
    }
  }
  #Collects alternating number of games since winner scores are always reported first in a set
  gameScores<-suppressWarnings(cbind(gameScores[c(TRUE, FALSE)],gameScores[c(FALSE, TRUE)]))
  #Sums games won by each player
  winnerWon<-sum(gameScores[,1])
  loserWon<-sum(gameScores[,2])
  #Checks for bug in 1972 match where score is 6-Feb(error in data)
  if(is.na(loserWon)){
    loserWon<-0
  }
  #Starts creating data frame for output
  names<-rbind(as.character(match$winner_name),(as.character(match$loser_name)))
  #Gets percentages of games won by each player
  pcts<-rbind((winnerWon/totalPlayed),(loserWon/totalPlayed))
  #Gets ratings of players
  ratingsOfPs<-rbind(ratings[ratings$nameList==as.character(match$winner_name),2],ratings[ratings$nameList==as.character(match$loser_name),2])
  #Combines all three rows and names them appropiately
  out<-as.data.frame(cbind(names, pcts, ratingsOfPs))
  colnames(out)<-c('name','pct', 'rating')
  return(out)
}

