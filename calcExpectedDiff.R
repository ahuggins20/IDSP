calcExpectedPct<-function(p1,p2,ratings){
  #Gets the absolute value of the difference in the ratings of the two players
  diff<-abs(ratings[as.character(ratings$nameList)==p1,2]-ratings[as.character(ratings$nameList)==p2,2])
  if(diff>2.5){
    return(1)
  }
  return(.5+(.2*diff))
}
