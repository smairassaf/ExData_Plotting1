household_data <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
household_data_subset <- subset(household_data, Date == "1/2/2007" | Date == "2/2/2007")

household_data_subset$Date <- as.Date(household_data_subset$Date,"%d/%m/%Y")
household_data_subset <- cbind(household_data_subset, DateTime = strptime(paste(household_data_subset$Date,
                                                                                household_data_subset$Time, sep=" "),
                                                                          "%Y-%m-%d %H:%M:%S"))

png("plot2.png", width=480, height=480)
plot(household_data_subset$Global_active_power ~ household_data_subset$DateTime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()