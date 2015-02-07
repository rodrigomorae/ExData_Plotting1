## read data
data<-read.table(file=".//data//household_power_consumption.txt", header=TRUE, sep=";")
data1<-data[complete.cases(data),]
data1 <- subset(data1, Date == '1/2/2007' | Date == '2/2/2007')

## get date
x<- paste(as.character(data1$Date),as.character(data1$Time))
t<-strptime(x, "%d/%m/%Y %H:%M:%S")
data1$FullData<-t

## plot
plot(data1[,10],as.character(data1[,7]),type="l",ylab="Energy sub metering",xlab="")
points(data1[,10],as.character(data1[,8]), col="red",type="l")
points(data1[,10],as.character(data1[,9]), col="blue",type="l")
legend("topright",legend=c("Sub_meeting_1","Sub_meeting_2","Sub_meeting_3"),col=c("black","red","blue"), lty=1,text.font=2,cex=0.6,text.width=40000)
## I could not handle with the legend, if you did, please let me know how!!


##save
dev.copy(png, file = "plot3.png") 
dev.off()
