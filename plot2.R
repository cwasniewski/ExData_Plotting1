## Read in data and subset to the relevant dates
## ** Time-permitting comes back to this to do it in one step **
library(data.table)
dt <- fread("household_power_consumption.txt")
dt_s <- subset(dt, dt$Date == "1/2/2007" | dt$Date == "2/2/2007")

x <- strptime(paste(dt_s$Date, dt_s$Time), format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png")
plot(x, dt_s$Global_active_power, type = "l", main = "", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
