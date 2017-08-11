myData<- read.table("household_power_consumption.txt",sep=";", header=TRUE)
myData$Date <- as.character(myData$Date)
myData<- filter(myData, Date=="1/2/2007" | Date=="2/2/2007")
myData$Sub_metering_1 <- as.numeric(
  as.character(myData$Sub_metering_1))
myData$Sub_metering_2 <- as.numeric(
  as.character(myData$Sub_metering_2))
myData$Sub_metering_3 <- as.numeric(
  as.character(myData$Sub_metering_3))
myData$Global_active_power <- as.numeric(
  as.character(myData$Global_active_power))
myData$Global_reactive_power <- as.numeric(
  as.character(myData$Global_reactive_power))
myData$Voltage <- as.numeric(as.character(myData$Voltage))

png(filename="plot4.png")

par(mfrow=c(2,2))
plot(1:2880, myData$Global_active_power,type="l", axes=FALSE, ann=FALSE)
axis(1, at=c(1,1440,2880), lab=c("Thu","Fri","Sat"))
axis(2, las=1, at=2*0:3)
box()
title(ylab="Global Active Power")

plot(myData$Voltage, type="l",axes=FALSE,ann=FALSE)
axis(1, at=c(1,1440,2880), lab=c("Thu","Fri","Sat"))
axis(2, las=1, at=c(234,238,242,246))
box()
title(xlab="datetime",ylab="Voltage")

plot(myData$Sub_metering_1, type="l", axes=FALSE, ann=FALSE)
lines(myData$Sub_metering_2, type="l", col="red")
lines(myData$Sub_metering_3, type="l", col="blue")
axis(1, at=c(1,1440,2880), lab=c("Thu","Fri","Sat"))
axis(2, las=1, at=10*0:3)
box()
title(ylab="Energy sub metering")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,col=c("black","blue","red"),lty=c(1,1,1))

plot(myData$Global_reactive_power, type="l",axes=FALSE,ann=FALSE)
axis(1, at=c(1,1440,2880), lab=c("Thu","Fri","Sat"))
axis(2, las=1, at=0.1*0:5)
box()
title(xlab="datetime",ylab="Global_reactive_power")

dev.off()