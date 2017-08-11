library(dplyr)
myData<- read.table("household_power_consumption.txt",sep=";", header=TRUE)
myData$Date <- as.character(myData$Date)
myData<- filter(myData, Date=="1/2/2007" | Date=="2/2/2007")
myData$Global_active_power <- as.numeric(
                               as.character(myData$Global_active_power))
png(filename="plot1.png")
hist(myData$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()