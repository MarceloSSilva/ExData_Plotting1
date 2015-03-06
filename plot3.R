###
## plot-3
##

# It takes approximadely 20 seconds on a MacBook Pro - 2.4GHz core i5
# plot3.R

plot3 <- function() {
  library(lubridate)
  power <-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
  power_s<-power[(power$Date=="1/2/2007" | power$Date=="2/2/2007" ),]
  power_s$DateTime<-strptime(paste(power_s$Date,power_s$Time),"%d/%m/%Y %H:%M:%S")
  power_s$weekday <- wday(dmy(power_s$Date), label= TRUE)
  # just to check if thw wdays are in the Thu-Sat Range
  # View(power_s)
  png(file= "plot3.png", width = 480, height = 480, bg = "transparent")
  with(power_s, plot(power_s$DateTime, Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = ""))
  with(power_s, points(power_s$DateTime, Sub_metering_2, type = "l", col = "red"))
  with(power_s, points(power_s$DateTime, Sub_metering_3, type = "l", col = "blue"))
  legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.off()
}
