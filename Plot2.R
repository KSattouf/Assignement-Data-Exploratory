## Code for Plot 2 :

setwd("Your Directory")

## Subseting the data
hwc <- read.csv2("household_power_consumption.txt")
hwc$Date <- as.Date(hwc$Date, format="%d/%m/%Y")
data <- subset(hwc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(data$Date), data$Time);data$Datetime <- as.POSIXct(datetime)




# Converting the Global Power Active from a factor to a numeric value: 
GAPc <- as.numeric(as.character(data$Global_active_power))

## Plotting : 
with(data, plot(data$Datetime, GAPc, type = "l", xlab = "", ylab = "Global Active Power(Kilowatts)"))

## Save as PNG : 
png(file = "Plot4.png")
with(data, plot(data$Datetime, GAPc, type = "l", xlab = "", ylab = "Global Active Power(Kilowatts)"))
dev.off()
