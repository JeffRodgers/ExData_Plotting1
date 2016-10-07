raw.data <- read.csv("household_power_consumption.txt",stringsAsFactors = FALSE, sep = ";",dec = ".")
mySubSet <- raw.data[raw.data$Date %in% c("1/2/2007","2/2/2007") ,]

#Plot 2 Global Active Power TS
#Open png device

png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA, ,type = c("cairo"), antialias)

#Create Plot
myDate <- as.Date(mySubSet$Date,"%d/%m/%Y")
dateTime <- paste(as.Date(mySubSet$Date,"%d/%m/%Y") ,mySubSet$Time)
plot(as.POSIXct(dateTime),mySubSet$Sub_metering_1,
     main = "",
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     type = "l")
lines(as.POSIXct(dateTime),mySubSet$Sub_metering_2,col="red")
lines(as.POSIXct(dateTime),mySubSet$Sub_metering_3,col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 1,col = c("black","red","blue"))


#Close png device
dev.off() 
