dataPath <- "./household_power_consumption.txt"
dataFrame <- read.table(dataPath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Cleaning the Data with the missing values
dataFrame <- dataFrame[which(dataFrame$Global_active_power!="?" | dataFrame$Global_reactive_power!="?" | dataFrame$Voltage!="?"| dataFrame$Global_intensity!="?" | dataFrame$Sub_metering_1!="?" | dataFrame$Sub_metering_2!="?" | dataFrame$Sub_metering_3!="?"),]

#Subseting the Data for the specified Date range
filteredData <- dataFrame[dataFrame$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(filteredData$Date, filteredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(filteredData$Global_active_power)

subMetering1 <- as.numeric(filteredData$Sub_metering_1)
subMetering2 <- as.numeric(filteredData$Sub_metering_2)
subMetering3 <- as.numeric(filteredData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()