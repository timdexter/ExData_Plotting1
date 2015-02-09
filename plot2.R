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

png("plot2.png", width=480, height=480)
plot(data$Time, data$Global_active_power, ylab="Global Active Power (kilowatts)", type="l", xlab="", )
dev.off()