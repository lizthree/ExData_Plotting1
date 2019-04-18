# Exploratory Data Analysis - Course Assignment 1
# Plot 2
# Line
# Title: None
# Y[0:6] = Global Active Power (kilowatts)
# X[Thu:Sat] 

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

png("plot2.png", width=480, height=480)
plot(x=data$date_time, y = data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
