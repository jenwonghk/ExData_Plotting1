# Download data

library(plyr)
fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./exploratoryGraphic/HouseholdPowerConsumption.zip")
zipF <- list.files(path="./exploratoryGraphic", pattern = "*.zip", full.names = TRUE)
ldply(.data = zipF, .fun=unzip, exdir = "./exploratoryGraphic")

library(dplyr)
library(lubridate)

# preview data by importing 5 rows
data <- read.table("./exploratoryGraphic/household_power_consumption.txt", header=TRUE, nrow=5)

# Import data
data <- read.table("./exploratoryGraphic/household_power_consumption.txt", header=TRUE, sep = ";")

data <- filter(data, Date=="1/2/2007" | Date=="2/2/2007")

# plot1.png generation

data1 <- data
data1$Date <- dmy(data1$Date)
data1$Time <- hms(data1$Time)

data1$Global_active_power <- as.numeric(as.character(data1$Global_active_power))

png(
  filename = "./exploratoryGraphic/plot1.png",
  width     = 480,
  height    = 480,
  units     = "px"
)
hist(data1$Global_active_power, col='red', main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()
