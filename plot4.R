## read data
data<-read.table(file=".//data//household_power_consumption.txt", header=TRUE, sep=";")
data1<-data[complete.cases(data),]
data1 <- subset(data1, Date == '1/2/2007' | Date == '2/2/2007')

## get date
x<- paste(as.character(data1$Date),as.character(data1$Time))
t<-strptime(x, "%d/%m/%Y %H:%M:%S")
data1$FullDate<-t

## Plot
par(mfrow=c(2,2))
plot(data1[,10],data1[,3],type="l",ylab="Global Active Power (kilowatts)",xlab="")
plot(data1$FullDate,as.character(data1$Voltage),type="l",ylab="Vltage",xlab="datetime")
plot(data1[,10],as.numeric(as.character(data1[,7])),type="l",ylab="Energy sub metering",xlab="")
points(data1[,10],as.numeric(as.character(data1[,8])), col="red",type="l")
points(data1[,10],as.numeric(as.character(data1[,9])), col="blue",type="l")
## I could not handle with the legend, if you did, please let me know how!!
##legend("topright",legend=c("Sub_meeting_1","Sub_meeting_2","Sub_meeting_3"),col=c("black","red","blue"), lty=1,text.font=1,cex=0.6,text.width=40000)
plot(data1$FullDate,as.character(data1$Global_reactive_power),type="l",ylab=names(data1)[4],xlab="datetime")

##save
dev.copy(png, file = "plot4.png") 
dev.off()
