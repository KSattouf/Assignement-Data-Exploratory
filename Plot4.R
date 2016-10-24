## Code for Plot 2 :

setwd("Your Directory")

## Subseting the data
hwc <- read.csv2("household_power_consumption.txt")
hwc$Date <- as.Date(hwc$Date, format="%d/%m/%Y")
data <- subset(hwc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(data$Date), data$Time);data$Datetime <- as.POSIXct(datetime)




# Converting :
GAPc <- as.numeric(as.character(data$Global_active_power))
data$sub1 <- as.numeric(as.character(data$Sub_metering_1))
data$sub2 <- as.numeric(as.character(data$Sub_metering_2))
data$sub3 <- as.numeric(as.character(data$Sub_metering_3))
GRPc <- as.numeric(as.character(data$Global_reactive_power))

##Plotting 

par(mfrow = (2,2))
#1
with(data, plot(data$Datetime, GAPc, type = "l", xlab = "", ylab = "Global Active Power(Kilowatts)"))

#2
with(data, plot(Datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

#3
plot(data$Datetime, data$sub1, type="l", xlab="", ylab="Energy Sub Metering")
points(data$Datetime, data$sub2, type="l", col="red")
points(data$Datetime, data$sub3, type="l", col="purple")
legend("topright", lty=1, cex=0.75, col=c("black", "red", "purple"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#4
with(data, plot(Datetime, GRPc, type = "l", xlab  = "datetime", ylab = "Global_Reactive_Power"))

#Saving As Png
png(file= "plot4.png")
par(mfrow = c(2,2))
with(data, plot(data$Datetime, GAPc, type = "l", xlab = "", ylab = "Global Active Power(Kilowatts)"))
with(data, plot(Datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
plot(data$Datetime, data$sub1, type="l", xlab="", ylab="Energy Sub Metering")
points(data$Datetime, data$sub2, type="l", col="red")
points(data$Datetime, data$sub3, type="l", col="purple")
legend("topright", lty=1, cex=0.75, col=c("black", "red", "purple"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(data, plot(Datetime, GRPc, type = "l", xlab  = "datetime", ylab = "Global_Reactive_Power"))
dev.off()


