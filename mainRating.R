main<-function(startYear, ratings){
  allMatches<-data.frame() #Initializes data frame for all matches
  for(i in startYear:2019){
    matches<-read.csv(paste('https://raw.githubusercontent.com/JeffSackmann/tennis_atp/master/atp_matches_',i,'.csv', sep = ''))
    #Gets and combines all matches from specified years
    allMatches<-rbind(allMatches,matches)
  }
  if(ratings==1){
    #Checks if there is a specified data frame. If not, creates a new one
    ratings<-initAllNames(allMatches)
  }
  for(i in 1:nrow(allMatches)){
    #Iterates through all matches
    change<-changeRatings(allMatches[i,], ratings)
    #Generates amount to change ratings by
    if(change[2]){
      #If it is an upset, change is negative, leading to adding it to loser and subtracting it from winner
      ratings[ratings$nameList==as.character(allMatches[i,]$loser_name),2]<-ratings[ratings$nameList==as.character(allMatches[i,]$loser_name),2]+change[1]
      ratings[ratings$nameList==as.character(allMatches[i,]$winner_name),2]<-ratings[ratings$nameList==as.character(allMatches[i,]$winner_name),2]-change[1]
    }else{
      #Not an upset, change is added to winner, subtracted from loser
      ratings[ratings$nameList==as.character(allMatches[i,]$loser_name),2]<-ratings[ratings$nameList==as.character(allMatches[i,]$loser_name),2]-change[1]
      ratings[ratings$nameList==as.character(allMatches[i,]$winner_name),2]<-ratings[ratings$nameList==as.character(allMatches[i,]$winner_name),2]+change[1]
    }
  }
  #returns end result
  return(ratings)
}

