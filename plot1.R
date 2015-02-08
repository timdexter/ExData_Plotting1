plot01 <- function(filen)  {
# Use sqldf library to filter data as its read Library allows the use of SQL to
# 'select' rows that meet specific filter criteria. In this case we are looking
# for dates as string values
library(sqldf)
# powcon will contain data for required dates only
powcon <- read.csv.sql("data/household_power_consumption.txt",sep = ";",header = T,
                       sql = "select * from file where Date ='1/2/2007' or Date = '2/2/2007'")
cat("Read and filtered data\n")

# Generate histogram with appropriate titles and colors
# Write histogram to png format using 480 x 480 px and filename plot1.png

png(filename = filen,width = 480,height = 480)
hist(powcon$Global_active_power, col="red", ylim = c(0,1200), main = "Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
cat("File written \n")


}

# Usage

plot01("plot01.png")
