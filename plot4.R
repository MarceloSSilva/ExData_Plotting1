# It takes approximadely 20 seconds on a MacBook Pro - 2.4GHz core i5
###### plot4.R

plot4 <- function() {
  library(lubridate)
  power <-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
  power_s<-power[(power$Date=="1/2/2007" | power$Date=="2/2/2007" ),]
  power_s$DateTime<-strptime(paste(power_s$Date,power_s$Time),"%d/%m/%Y %H:%M:%S")
  png(file= "plot4.png", width = 480, height = 480, bg = "transparent")
  par(mfrow = c(2, 2))
  with(power_s, {
    # plot2.R
    plot(power_s$DateTime, Global_active_power, ylab = "Global Active Power", xlab = "", type = "l")
    # plot4.1.R
    plot(power_s$DateTime, Voltage, type = "l", col = "black", ylab = "Voltage", xlab = "datetime", ylim = c(234,246))
    # plot3.R
    plot(power_s$DateTime, Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
    with(power_s, points(power_s$DateTime, Sub_metering_2, type = "l", col = "red"))
    with(power_s, points(power_s$DateTime, Sub_metering_3, type = "l", col = "blue"))
    legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    #plot4.4
    plot(power_s$DateTime, Global_reactive_power, type = "l", col = "black", ylab = "Global_reactive_power", xlab = "datetime", ylim = c(0.0, 0.5))
    }
  )
dev.off()
}