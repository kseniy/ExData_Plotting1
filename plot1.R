data = read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE)
new.data = subset(data, Date == "1/2/2007" | Date == "2/2/2007")
datetime = with(new.data, paste(Date, Time))
new.data$Date = strptime(datetime, "%d/%m/%Y %H:%M:%S")

## plot1
globalActivePower = as.numeric(new.data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()