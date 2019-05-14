pctGamesWon<-function(match,ratings){
  specScore<-match$score
  setScores<-strsplit(as.character(specScore),' ')
  gamesPerSet<-lapply(setScores, function(i){
    strsplit(i,'-')
  })
  gameScores<-unlist(gamesPerSet, TRUE)
  gameScores<-lapply(gameScores, function(i){                                                                                                                                 
    substr(i,1,1)
    })
  gameScores<-suppressWarnings(as.numeric(gameScores))
  gameScores<-na.omit(gameScores)
  totalPlayed<-sum(gameScores)
  if(totalPlayed==0||is.na(totalPlayed)){
    pctWon<-calcExpectedPct(as.character(match$winner_name),as.character(match$loser_name),ratings)
    names<-rbind(as.character(match$winner_name),(as.character(match$loser_name)))
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
  gameScores<-suppressWarnings(cbind(gameScores[c(TRUE, FALSE)],gameScores[c(FALSE, TRUE)]))
  winnerWon<-sum(gameScores[,1])
  loserWon<-sum(gameScores[,2])
  names<-rbind(as.character(match$winner_name),(as.character(match$loser_name)))
  pcts<-rbind((winnerWon/totalPlayed),(loserWon/totalPlayed))
  ratingsOfPs<-rbind(ratings[ratings$nameList==as.character(match$winner_name),2],ratings[ratings$nameList==as.character(match$loser_name),2])
  out<-as.data.frame(cbind(names, pcts, ratingsOfPs))
  colnames(out)<-c('name','pct', 'rating')
  return(out)
}

