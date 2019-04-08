best<-function(state, symptom){
  outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character") 
  if(!(state %in% outcome[,7])){
    stop('Invalid State')
  }
  if(!(symptom %in% c('heart attack','heart failure', 'pneumonia'))){
      stop('Invalid Outcome')
  }
  byState<-outcome[which(outcome$State==state),]  #Gets all rows with specified state
  
  placementOfOutcomes<-c('heart attack',11,'heart failure',17,'pneumonia',23)
  column<-placementOfOutcomes[1+which(placementOfOutcomes==symptom)] #Finds the column of the specified outcome
  
  ranks<-byState[,as.numeric(column)] #Pulls all rates from specified outcome
  
  sortRanks<-sort(as.numeric(ranks)) #Sorts rates ascending
  
  bestRate<-sortRanks[1] #Finds best rate
  
  temp<-as.numeric(byState[,as.numeric(column)])==bestRate 
  #Starts the search for the row number and name of best rate
  
  rowNum<-which(temp==TRUE) #Pulls row number with name and best rate
  
  return(byState[rowNum,2])
}
