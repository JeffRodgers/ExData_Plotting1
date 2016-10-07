raw.data <- read.csv("household_power_consumption.txt",stringsAsFactors = FALSE, sep = ";",dec = ".")
mySubSet <- raw.data[raw.data$Date %in% c("1/2/2007","2/2/2007") ,]

#Plot 2 Global Active Power TS
#Open png device

png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA, ,type = c("cairo"), antialias)

#Create Plot
myDate <- as.Date(mySubSet$Date,"%d/%m/%Y")
dateTime <- paste(as.Date(mySubSet$Date,"%d/%m/%Y") ,mySubSet$Time)
plot(as.POSIXct(dateTime),mySubSet$Global_active_power,
     main = "",
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     type = "l")


#Close png device
dev.off() 
