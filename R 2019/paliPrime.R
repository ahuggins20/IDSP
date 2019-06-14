paliPrime<-function(x){
  bool<-1
  num<-x
  y<-2
  while(y<x){
    if(num%%y==0){
      bool<-0
      print("Not Prime")
    }
    y<-y+1
  }
  num<-x
  rvse<-0
  while(num!=0){
    rvse<-rvse*10
    rvse<-rvse+num%%10
    num<-floor(num/10)
  }
  if(x!=rvse){
    bool<-0
  }
  if(bool==1){
    return(TRUE)
  }else{
    return(FALSE)
  }
}

