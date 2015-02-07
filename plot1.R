## read data
data<-read.table(file=".//data//household_power_consumption.txt", header=TRUE, sep=";")
data1 <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

#plot
hist(as.numeric(as.character(data1[,3])),col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")

#save in png
dev.copy(png, file = "plot1.png") 
dev.off()