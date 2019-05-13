main<-function(startYear, ratings){
  allMatches<-data.frame()
  for(i in startYear:2018){
    matches<-read.csv(paste('https://raw.githubusercontent.com/JeffSackmann/tennis_atp/master/atp_matches_',i,'.csv', sep = ''))
    allMatches<-rbind(allMatches,matches)
  }
  if(ratings==1){
    ratings<-initAllNames(allMatches)
  }
  for(i in 1:nrow(allMatches)){
    change<-changeRatings(allMatches[i,], ratings)
    if(change[2]){
      ratings[ratings$nameList==as.character(allMatches[i,]$loser_name),2]<-ratings[ratings$nameList==as.character(allMatches[i,]$loser_name),2]+change[1]
      ratings[ratings$nameList==as.character(allMatches[i,]$winner_name),2]<-ratings[ratings$nameList==as.character(allMatches[i,]$winner_name),2]-change[1]
    }else{
      ratings[ratings$nameList==as.character(allMatches[i,]$loser_name),2]<-ratings[ratings$nameList==as.character(allMatches[i,]$loser_name),2]-change[1]
      ratings[ratings$nameList==as.character(allMatches[i,]$winner_name),2]<-ratings[ratings$nameList==as.character(allMatches[i,]$winner_name),2]+change[1]
    }
  }
  return(ratings)
}

