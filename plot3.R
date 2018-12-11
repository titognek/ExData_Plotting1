
## set working directory
setwd("~/Documents/DataScienceToolbox/Course 4/WD/")

## calculate required memory 
memory = (9 * 2075259 * 8)/1E+6 ## 150 Mb
memory

## read the first 10 rows of the dataset
preview <- read.table("household_power_consumption.txt", nrow =10, header = TRUE, sep = ";", na.strings = "?")

## read the entire dataset and assign "NA" to "?"
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data2 <- data

## change class to the Date variable
data2$Date <- as.Date(data2$Date, "%d/%m/%Y")

## subset the data by the provided dates
data3 <- subset(data2, Date == "2007-02-01" | Date == "2007-02-02")

## change the class to the Time varianle
data3$Time <- strptime(data3$Time, "%H:%M:%S")
data3$Time <- strftime(data3$Time, '%H:%M:%S')

## Create a variable that contains both date and time, and covert format
data3$dateTime <- as.POSIXct(paste(data3$Date, data3$Time))

## generate plot 3
png(file = "plot3.png", width = 480, height = 480, units = "px")
plot(data3$dateTime, data3$Global_intensity, type = "n", xlab = "", ylab = "Energy sub metering", ylim = c(0,38))
lines(data3$dateTime, data3$Sub_metering_1)
lines(data3$dateTime, data3$Sub_metering_2, col = "red")
lines(data3$dateTime, data3$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()


