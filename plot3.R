# use plot2.R result:  data2

# plot3.png generation

data2$Sub_metering_1 <- as.numeric(as.character(data2$Sub_metering_1))
data2$Sub_metering_2 <- as.numeric(as.character(data2$Sub_metering_2))
data2$Sub_metering_3 <- as.numeric(as.character(data2$Sub_metering_3))

range(data2$Sub_metering_1)
range(data2$Sub_metering_2)
range(data2$Sub_metering_3)

png(
  filename = "./exploratoryGraphic/plot3.png",
  width     = 480,
  height    = 480,
  units     = "px"
)

with(data2, plot(date_time, Sub_metering_1, type="l", 
                 xlab ="", ylab = "Energy sub metering",
                 ylim=c(0,38)))

with(data2, points(date_time, Sub_metering_2, type="l", col="red"))

with(data2, points(date_time, Sub_metering_3, type="l", col="blue"))   

legend("topright", lty=1, col=c("black","red","blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

