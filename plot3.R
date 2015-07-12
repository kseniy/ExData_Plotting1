data = read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE)
new.data = subset(data, Date == "1/2/2007" | Date == "2/2/2007")
datetime = with(new.data, paste(Date, Time))
new.data$Date = strptime(datetime, "%d/%m/%Y %H:%M:%S")

globalActivePower = as.numeric(new.data$Global_active_power)
sm1 = as.numeric(new.data$Sub_metering_1)
sm2 = as.numeric(new.data$Sub_metering_2)
sm3 = as.numeric(new.data$Sub_metering_3)

## plot3
png("plot3.png", width=480, height=480)
plot(new.data$Date, sm1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(new.data$Date, sm2, col = "red")
lines(new.data$Date, sm3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)
dev.off()