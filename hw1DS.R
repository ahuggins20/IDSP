#11
con <- file("hw1DS.txt")
open(con, "r")
data <- read.csv(con)
ls(data)
#12
data[1:2,]
#13
data[0]
#14
data[152:153,]
#15
data[47,1]
#16
length(which(is.na(data[,1])))
#17
mean(data[,1],na.rm=TRUE)
#18
sub<-subset(data, Ozone>31 & Temp>90)
mean(sub[,2])
#19
sub<-subset(data,Month==6)
mean(sub[,4])
#20
sub<-subset(data, Month==5)
max(sub[,1],na.rm=TRUE)