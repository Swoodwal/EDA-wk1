file_name <- "C:/Users/sidak/Documents/exdata_data_household_power_consumption/household_power_consumption.txt"
data <- read.table(file_name, header = TRUE, sep = ";", dec = ".", na.strings = "?")
data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
hist(data[, 3], col = "green", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

#q2
Sys.setlocale("LC_TIME", "English")

date_converted <- as.Date(data[, 1], format = "%d/%m/%Y")
time_converted <- strptime(data[, 2], format = "%H:%M:%S")
time_axis <- as.POSIXct(paste(date_converted, data[, 2]))

plot(time_axis, data[, 3], xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

#q3
plot(time_axis, data[, 7], xlab = "", ylab = "Energy sub metering", type = "l")
lines(time_axis, data[, 8], col = "yellow")
lines(time_axis, data[, 9], col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black","red","blue"), lty = 1)

#Q4
par(mfrow = c(2,2))

plot(time_axis, data[, 3], xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

plot(time_axis, data[, 5], xlab = "datetime", ylab = "Voltage", type = "l")

plot(time_axis, data[, 7], xlab = "", ylab = "Energy sub metering", type = "l")
lines(time_axis, data[, 8], col = "red")
lines(time_axis, data[, 9], col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black","red","blue"), cex = 0.8, lty = 1 , bty = "n")

plot(time_axis, data[, 4], xlab = "datetime", ylab = "Global_reactive_power", type = "l")