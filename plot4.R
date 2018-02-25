## Clyde Alino

library(data.table)
setwd("~/R Programming Projects/Electric Power Consumption")

# Read power consumption data and store it to consumptionDT variable
consumptionDT <- fread("household_power_consumption.txt", na.strings = "?")


# Create a new column(date_time) to house both Date and Time Variables
consumptionDT[, date_time:= as.POSIXct(paste(Date, Time), format= "%d/%m/%Y %H:%M:%S")]

# Reload the consumption data for dates (2007-02-01 and 2007-02-03) to the existing consumptionData variable
# This is to capture only Thu, Fri, Sat (3 days) consumptions
consumptionDT <- consumptionDT[(date_time >= "2007-02-01") & (date_time <= "2007-02-03")]


# Set plot width and heigth specifications
png("plot4.png", width = 480, height = 480)

# Set plot parameters (2 rows, with 2 plots by each row (2X2))
par(mfrow = c(2,2))

# Create Plot1
plot(consumptionDT[, date_time], consumptionDT[, Global_active_power], type = "l", xlab = "", ylab = "Global Active Power")

# Create Plot 2
plot(consumptionDT[, date_time], consumptionDT[, Voltage], type = "l", xlab = "datetime", ylab = "Voltage")

# Create plot3
plot(consumptionDT[, date_time], consumptionDT[, Sub_metering_1], col = "black", type="l", xlab = "", ylab="Energy sub metering")
lines(consumptionDT[, date_time], consumptionDT[, Sub_metering_2], col = "red")
lines(consumptionDT[, date_time], consumptionDT[, Sub_metering_3], col = "blue")
legend("topright", col = c("black", "red", "blue")
       , c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , lty = c(1,1,1)
       , lwd = c(1,1,1)
       , bty = "n"
       , cex = 0.9)

# Create plot 4
plot(consumptionDT[, date_time], consumptionDT[, Global_reactive_power], type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# Finishing plot creation
dev.off()