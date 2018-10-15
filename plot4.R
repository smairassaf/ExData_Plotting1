household_data <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
household_data_subset <- subset(household_data, Date == "1/2/2007" | Date == "2/2/2007")

household_data_subset$Date <- as.Date(household_data_subset$Date,"%d/%m/%Y")
household_data_subset <- cbind(household_data_subset, DateTime = strptime(paste(household_data_subset$Date,
                                                                                household_data_subset$Time, sep=" "),
                                                                          "%Y-%m-%d %H:%M:%S"))

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(household_data_subset$Global_active_power ~ household_data_subset$DateTime, type="l", xlab="", ylab="Global Active Power")

plot(household_data_subset$Voltage ~ household_data_subset$DateTime, type="l", xlab="datetime", ylab="Voltage")

plot( household_data_subset$Sub_metering_1 ~ household_data_subset$DateTime, type="l", xlab="", ylab="Energy sub metering")
lines(household_data_subset$Sub_metering_2 ~ household_data_subset$DateTime, col = "red")
lines(household_data_subset$Sub_metering_3 ~ household_data_subset$DateTime, col = "blue")
legend("topright", lty=1, lwd =1, col=c("black","red","blue") ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")

plot(household_data_subset$Global_reactive_power ~ household_data_subset$DateTime, type="l", xlab="datetime", ylab = "Global_reactive_power")

dev.off()