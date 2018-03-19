# use plot2.R result: data2

# 4 plot in one
png(
  filename = "./exploratoryGraphic/plot4.png",
  width     = 480,
  height    = 480,
  units     = "px"
)


par(mfrow = c(2,2), mar=c(4,4,2,1))

#1st image: plot2.png

with(data2, plot(date_time, Global_active_power, type="l", 
                 xlab ="", ylab = "Global Active Power (kilowatts)",
                 ylim=c(0,7.5)))


#2nd image:
data2$Voltage  <- as.numeric(as.character(data2$Voltage))
range(data2$Voltage)

with(data2, plot(date_time, Voltage, type="l",
                 xlab="datetime", ylab="Voltage",
                 ylim=c(233, 246.6)))


#3rd image: plot3.png

with(data2, plot(date_time, Sub_metering_1, type="l", 
                 xlab ="", ylab = "Energy sub metering",
                 ylim=c(0,38)))

with(data2, points(date_time, Sub_metering_2, type="l", col="red"))

with(data2, points(date_time, Sub_metering_3, type="l", col="blue"))   

legend("topright", lty=1, col=c("black","red","blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#4th image:

data2$Global_reactive_power  <- as.numeric(as.character(data2$Global_reactive_power))
range(data2$Global_reactive_power)

with(data2, plot(date_time, Global_reactive_power, type="l",
                 xlab="datetime", ylim=c(0,0.5)))

dev.off()
