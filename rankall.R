rankall<-function(symptom, rank='best'){
  if(!(symptom %in% c('heart attack','heart failure', 'pneumonia'))){
    stop=('Invalid Outcome')
  }
  outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character", stringsAsFactors = FALSE)#Takes in Data
  
  stateList<-unique(outcome[,7])#Create list of all states
  stateList<-sort(stateList)
  placementOfOutcomes<-c('heart attack',11,'heart failure',17,'pneumonia',23)
  column<-placementOfOutcomes[1+which(placementOfOutcomes==symptom)]#Gets column for symptom
  
  outList<-data.frame(stringsAsFactors = FALSE)#Creates data frame for output
  
  for(state in stateList){#Goes through all states
    sorted<-outcome[which(outcome$State==state),]#Sorts by state
    
    rankList<-cbind(sorted[,as.numeric(column)],sorted[,2])#Creates data frame of names and ranks
    
    rankList<-rankList[rankList[,1]!='Not Available']#Removes all Not Availables
    
    out<-cbind(as.numeric(rankList[1:(length(rankList)/2)]),rankList[(1+(length(rankList)/2)):length(rankList)])
    #Re-cbind columns back together
    if(nrow(out)>1){
      test<-out[order(as.numeric(out[,1]),out[,2]),]#Sorts by rate and uses name as tiebreak
    }else if(nrow(out)>rank){
      temp<-data.frame(Hospital=out[1,2],State=state)
      outList<-rbind(outList,temp)
      next
    }else{
      temp<-data.frame(Hospital=NA,State=state)
      outList<-rbind(outList, temp)
      next
    }
  temp<-data.frame(Hospital='test',State='test')
  if(rank=='best'){#Check for word specific ranks
    rank<-1
  }else if(rank=='worst'){
    rank<-nrow(test)
  }else if(rank>nrow(test)){#Check for out of bounds rank
    temp<-data.frame(Hospital='NA',State=state)
  }else{
    temp<-data.frame(Hospital=test[rank,2],State=state)
  }
  outList<-rbind(outList, temp)
  }
  return(outList)
}
