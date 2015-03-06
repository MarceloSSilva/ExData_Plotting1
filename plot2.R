### plot2.R
## It takes approximadely 20 seconds on a MacBook Pro - 2.4GHz core i5
#
plot2 <- function() {
  library(lubridate)
  power <-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
  power_s<-power[(power$Date=="1/2/2007" | power$Date=="2/2/2007" ),]
  power_s$DateTime<-strptime(paste(power_s$Date,power_s$Time),"%d/%m/%Y %H:%M:%S")
  power_s$weekday <- wday(dmy(power_s$Date), label= TRUE)
  # just to check if the wdays are in the Thu-Sat Range
  # View(power_s)
  png(file= "plot2.png", width = 480, height = 480, bg = "transparent")
  with(power_s, plot(power_s$DateTime, Global_active_power, ylab = "Global Active Power (kilowatt)", xlab = "", type = "l"))
  dev.off()
}
