data = read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE)
new.data = subset(data, Date == "1/2/2007" | Date == "2/2/2007")
datetime = with(new.data, paste(Date, Time))
new.data$Date = strptime(datetime, "%d/%m/%Y %H:%M:%S")

globalActivePower = as.numeric(new.data$Global_active_power)
voltage = as.numeric(new.data$Voltage)
globalReactPower = as.numeric(new.data$Global_reactive_power)

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
# plot 1
plot(new.data$Date, globalActivePower, type="l", xlab="", ylab="Global Active Power") 
# plot 2
plot(new.data$Date, voltage, type="l", xlab="datetime", ylab="Voltage")
# plot 3
plot(new.data$Date, sm1, type = "l", xlab = "", ylab = "Energy Submetering")
lines(new.data$Date, sm2, type = "l", col = "red")
lines(new.data$Date, sm3, type = "l", col = "blue")
legend("topright", bty="n", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, col = c("black", "red", "blue")) 
# plot 4
plot(new.data$Date, globalReactPower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()