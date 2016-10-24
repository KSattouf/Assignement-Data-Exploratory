## Code for Plot 3 :

setwd("Your Directory")

## Subseting the data
hwc <- read.csv2("household_power_consumption.txt")
hwc$Date <- as.Date(hwc$Date, format="%d/%m/%Y")
data <- subset(hwc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(data$Date), data$Time);data$Datetime <- as.POSIXct(datetime)

data$sub1 <- as.numeric(as.character(data$Sub_metering_1))
data$sub2 <- as.numeric(as.character(data$Sub_metering_2))
data$sub3 <- as.numeric(as.character(data$Sub_metering_3))

## Plotting : 
plot(data$Datetime, data$sub1, type="l", xlab="", ylab="Energy Sub Metering")
points(data$Datetime, data$sub2, type="l", col="red")
points(data$Datetime, data$sub3, type="l", col="purple")
legend("topright", lty=1, cex=0.75, col=c("black", "red", "purple"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving the plot : 
png(file = "plot3.png")
plot(data$Datetime, data$sub1, type="l", xlab="", ylab="Energy Sub Metering")
points(data$Datetime, data$sub2, type="l", col="red")
points(data$Datetime, data$sub3, type="l", col="purple")
legend("topright", lty=1, cex=0.75, col=c("black", "red", "purple"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()