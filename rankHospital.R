rankHospital<-function(state, symptom, rank){
  outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character") 
  if(!(state %in% outcome[,7])){
    stop('Invalid State')
  }
  if(!(symptom %in% c('heart attack','heart failure', 'pneumonia'))){
    stop('Invalid Outcome')
  }
  sorted<-outcome[which(outcome$State==state),]#Sort by state
  
  placementOfOutcomes<-c('heart attack',11,'heart failure',17,'pneumonia',23)
  column<-placementOfOutcomes[1+which(placementOfOutcomes==symptom)]#Find proper column to analyze
  
  rankList<-cbind(sorted[,as.numeric(column)],sorted[,2])#Add the names back to the list
  
  rankList<-rankList[rankList[,1]!='Not Available']#Remove any Not Availables
  
  out<-cbind(as.numeric(rankList[1:(length(rankList)/2)]),rankList[(1+(length(rankList)/2)):length(rankList)])
  #Re-cbind the rates and names
  
  out<-out[order(as.numeric(out[,1]),out[,2]),]#Sort using rates with name as tiebreaker
  if(rank=='best'){#Check for word specific ranks
    rank<-1
  }else if(rank=='worst'){
    rank<-length(out)/2
  }else if(rank>(length(out)/2)){#Check for out of bounds rank
    return(NA)
  }else if(class(rank)!='numeric'){
    stop('Invalid Rank')
  }
  return(out[rank,2])#Return name of that ranked hospital
}

