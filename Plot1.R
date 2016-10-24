## Code for Plot 3 :

setwd("Your Directory")

## Subseting the data
hwc <- read.csv2("household_power_consumption.txt")
hwc$Date <- as.Date(hwc$Date, format="%d/%m/%Y")
data <- subset(hwc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(data$Date), data$Time);data$Datetime <- as.POSIXct(datetime)




# Converting the Global Power Active from a factor to a numeric value: 
GAPc <- as.numeric(as.character(data$Global_active_power))

# Plotting the Histogram
hist(GAPc, main = "Global Power Active", col = "red", xlab = "Global Active Power(Kilowatts)")
axis(2,seq(0,1200, by = 200))

#Saving the Plot as a PNG File : 

png("Plot1.png" , width = 480, height = 480)
hist(GAPc, main = "Global Power Active", col = "red", xlab = "Global Active Power(Kilowatts)")
axis(2,seq(0,1200, by = 200))
dev.off()

   