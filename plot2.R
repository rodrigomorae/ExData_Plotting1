## read data
data<-read.table(file=".//data//household_power_consumption.txt", header=TRUE, sep=";")
data1 <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

## get date
x<- paste(as.character(data1$Date),as.character(data1$Time))
t<-strptime(x, "%d/%m/%Y %H:%M:%S")
data1$FullData<-t

##plot
plot(data1[,10],as.character(data1[,3]),type="l",ylab="Global Active Power (kilowatts)",xlab="")

##save in png
dev.copy(png, file = "plot2.png") 
dev.off()