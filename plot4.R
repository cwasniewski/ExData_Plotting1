## Read in data and subset to the relevant dates
## ** Time-permitting comes back to this to do it in one step **
library(data.table)
dt <- fread("household_power_consumption.txt")
dt_s <- subset(dt, dt$Date == "1/2/2007" | dt$Date == "2/2/2007")

x <- strptime(paste(dt_s$Date, dt_s$Time), format = "%d/%m/%Y %H:%M:%S")

## building a 2x2 grid of plots
## set mfcol = 2, plots will fill column-wise

## open png device

png(filename = "plot4.png")
par(mfcol = c(2,2))

## top left plot
## copied from plot2.R

plot(x, dt_s$Global_active_power, type = "l", main = "", 
     xlab = "", ylab = "Global Active Power")

## bottom left plot
## copied from plot3.R

with(dt_s, plot(x, dt_s$Sub_metering_1, col = "black", type = "l", 
                main = "", xlab = "", ylab = "Energy sub metering"))
with(dt_s, points(x, dt_s$Sub_metering_2, col = "red", type = "l"))
with(dt_s, points(x, dt_s$Sub_metering_3, col = "blue", type = "l"))
lgd <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
with(dt_s, legend("topright", col = c("black", "red", "blue"), legend = lgd, lwd = 2, bty = "n"))

## top right plot
## this one's new

plot(x, dt_s$Voltage, col = "black", type = "l", 
     main = "", xlab = "datetime", ylab = "Voltage")

## bottom right plot
## this one's also new

plot(x, dt_s$Global_reactive_power, col = "black", type = "l",
    main = "", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
