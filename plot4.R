raw.data <- read.csv("household_power_consumption.txt",stringsAsFactors = FALSE, sep = ";",dec = ".")
mySubSet <- raw.data[raw.data$Date %in% c("1/2/2007","2/2/2007") ,]

#Plot 4 MultiPlot
#Open png device

png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA, ,type = c("cairo"), antialias)

#Create histogram
myDate <- as.Date(mySubSet$Date,"%d/%m/%Y")
dateTime <- paste(as.Date(mySubSet$Date,"%d/%m/%Y") ,mySubSet$Time)

par(mfrow=c(2,2))

plot(as.POSIXct(dateTime),mySubSet$Global_active_power,
     main = "",
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     type = "l")


plot(as.POSIXct(dateTime),mySubSet$Voltage,
     main = "",
     ylab = "Voltage",
     xlab = "datetime",
     type = "l")


plot(as.POSIXct(dateTime),mySubSet$Sub_metering_1,
     main = "",
     ylab = "Energy sub metering",
     xlab = "",
     type = "l")
lines(as.POSIXct(dateTime),mySubSet$Sub_metering_2,col="red")
lines(as.POSIXct(dateTime),mySubSet$Sub_metering_3,col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 1,bty = "n",col = c("black","red","blue"))



plot(as.POSIXct(dateTime),mySubSet$Global_reactive_power,
     main = "",
     ylab = "Global_reactive_power",
     xlab = "datetime",
     type = "l")


#Close png device
dev.off() 
