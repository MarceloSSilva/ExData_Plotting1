# plot1.R
# It takes approximadely 20 seconds on a MacBook Pro - 2.4GHz core i5
plot1 <- function() {
  power <-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
  power_s<-power[(power$Date=="1/2/2007" | power$Date=="2/2/2007" ),]
  png(file= "plot1.png", width = 480, height = 480, bg = "transparent")
  hist(power_s$Global_active_power, col = "red", main= "Global Active Power", xlab = "Global Active Power (kilowatts)", ylim = c(0,1200))
  dev.off()
}