
household_data <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
household_data_subset <- subset(household_data, Date == "1/2/2007" | Date == "2/2/2007")

png("plot1.png", width=480, height=480)
hist(household_data_subset$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()