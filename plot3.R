# Script to create plot 2 for Exploratory Data Analysis course 
# Tim Dexter
#2/4/2015

# Read data

data <- read.table("data/household_power_consumption.txt",header=TRUE, sep=";",
                   colClasses=c("character", "character", rep("numeric",7)), na="?")
# convert date and time 
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
# Specific dates required 2007-02-01 and 2007-02-02
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data <- subset(data, Date %in% dates)

#Create plot

png("plot3.png", width=480, height=480)
plot(data$Time, data$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"),  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)
dev.off()