## Read in data and subset to the relevant dates
## ** Time-permitting comes back to this to do it in one step **
library(data.table)
dt <- fread("household_power_consumption.txt")
dt_s <- subset(dt, dt$Date == "1/2/2007" | dt$Date == "2/2/2007")

png(filename = "plot1.png")
hist(as.numeric(dt_s$Global_active_power), breaks = 12, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()