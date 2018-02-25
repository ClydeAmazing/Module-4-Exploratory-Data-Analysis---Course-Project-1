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
png("plot2.png", width = 480, height = 480)

# Create plot2
plot(x = consumptionDT[, date_time], y = consumptionDT[, Global_active_power],type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Finishing plot creation
dev.off()