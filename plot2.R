#use data result from plot1.R

# plot2.png gneration

library(tidyr)
data2 <- unite(data, date_time, c(Date, Time), remove=FALSE)
head(data2$date_time)
data2$date_time <- dmy_hms(data2$date_time)

data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))

# range of ylim
range(data2$Global_active_power)

png(
  filename = "./exploratoryGraphic/plot2.png",
  width     = 480,
  height    = 480,
  units     = "px"
)

with(data2, plot(date_time, Global_active_power, type="l", 
                 xlab ="", ylab = "Global Active Power (kilowatts)",
                 ylim=c(0,7.5)))

dev.off()