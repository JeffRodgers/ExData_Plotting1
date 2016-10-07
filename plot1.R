raw.data <- read.csv("household_power_consumption.txt",stringsAsFactors = FALSE, sep = ";",dec = ".")
mySubSet <- raw.data[raw.data$Date %in% c("1/2/2007","2/2/2007") ,]

#Plot 1 Global Active Power
#Open png device

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA, ,
    type = c("cairo"), antialias)


#Create histogram

with(mySubSet,hist(as.numeric(Global_active_power),
                   main = "Global Active Power",
                   xlab = "Global Active Power (kilowatts)",
                   col = "red"))

#Close png device
dev.off() 
