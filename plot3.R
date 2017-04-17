## Read in data and subset to the relevant dates
## ** Time-permitting comes back to this to do it in one step **
library(data.table)
dt <- fread("household_power_consumption.txt")
dt_s <- subset(dt, dt$Date == "1/2/2007" | dt$Date == "2/2/2007")

x <- strptime(paste(dt_s$Date, dt_s$Time), format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot3.png")
with(dt_s, plot(x, dt_s$Sub_metering_1, col = "black", type = "l", 
                main = "", xlab = "", ylab = "Energy sub metering"))
with(dt_s, points(x, dt_s$Sub_metering_2, col = "red", type = "l"))
with(dt_s, points(x, dt_s$Sub_metering_3, col = "blue", type = "l"))
lgd <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
with(dt_s, legend("topright", col = c("black", "red", "blue"), legend = lgd, lwd = 2))
dev.off()