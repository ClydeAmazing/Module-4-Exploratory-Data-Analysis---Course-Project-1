## Clyde Alino

library(data.table)
setwd("~/R Programming Projects/Electric Power Consumption")

# Read power consumption data and store it to consumptionDT variable
consumptionDT <- fread("household_power_consumption.txt", na.strings = "?")

# Convert Date/Strings Strings to Date/Time Literals using as.Date method
consumptionDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]


# Reload the consumption data for dates (2007-02-01 and 2007-02-02) to the existing consumptionData variable
consumptionDT <- consumptionDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]


# Set plot width and heigth specifications
png("plot1.png", width = 480, height = 480)

# Create plot1
hist(consumptionDT[, Global_active_power], main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

# Finishing plot creation
dev.off()
