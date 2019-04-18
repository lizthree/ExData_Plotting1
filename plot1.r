# Exploratory Data Analysis - Course Assignment 1
# Plot 1
# Bar graph, red
# Title: Global Active Power
# Y[0:1200] = Frequency
# X[0:6] = Global Active Power (kilowatts)

library(dplyr)
library(tools)

# make sure the .txt file is in your wd
file = file.path(getwd(), "household_power_consumption.txt")
tbl <- read.table(file = file, dec = ".", stringsAsFactors = FALSE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), header = TRUE, sep = ";", na.strings = "?")

# subset data to free space
data <- filter(tbl, Date %in% c("1/2/2007", "2/2/2007"))
rm(tbl)

png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylim = c(0,1200), 
     xlim = c(0,6), breaks = 12)
dev.off()
