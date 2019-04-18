# Exploratory Data Analysis - Course Assignment 1
# Plot 3
# Lines
# Title: None
# Y[0:6] = Energy Sub Metering
# X[Thu:Sat] 
# Legend: meter 1 black, meter 2 red, meter 3 blue

library(dplyr)
library(tools)

# make sure the .txt file is in your wd
file = file.path(getwd(), "household_power_consumption.txt")
tbl <- read.table(file = file, dec = ".", stringsAsFactors = FALSE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), header = TRUE, sep = ";", na.strings = "?")

# subset data to free space
data <- filter(tbl, Date %in% c("1/2/2007", "2/2/2007"))
rm(tbl)

# new column date_time for x axis
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- mutate(data, date_time = as.POSIXct(paste(data$Date, data$Time, sep=" "), template = "%d/%m/%Y %H:%M:%S", tz = Sys.timezone()))

png("plot3.png", width=480, height=480)
with(data, 
     { plot(x=date_time, y = Sub_metering_1, type="l", col = "black", xlab="", ylab="Energy sub metering")
       lines(x=date_time, y = Sub_metering_2, type="l", col = "red")
       lines(x=date_time, y = Sub_metering_3, type="l", col = "blue")
       legend("topright", lty = "solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
     })
dev.off()
