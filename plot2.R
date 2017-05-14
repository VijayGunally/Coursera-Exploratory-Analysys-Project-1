#Path of the Data File
dataPath <- "./household_power_consumption.txt"
dataFrame <- read.table(dataPath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Cleaning the Data with the missing values
dataFrame <- dataFrame[which(dataFrame$Global_active_power!="?" | dataFrame$Global_reactive_power!="?" | dataFrame$Voltage!="?"| dataFrame$Global_intensity!="?" | dataFrame$Sub_metering_1!="?" | dataFrame$Sub_metering_2!="?" | dataFrame$Sub_metering_3!="?"),]

#Subseting the Data for the specified Date range
filteredData <- dataFrame[dataFrame$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(filteredData$Date, filteredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(filteredData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()