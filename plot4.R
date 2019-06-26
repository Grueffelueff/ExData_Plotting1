plot4 <- function(){
  library(dplyr)
  data <- read.csv(file="household_power_consumption.txt", sep=";", header=TRUE, 
                   na.strings="?")
  newdata <- subset(data, (Date=="1/2/2007"|Date=="2/2/2007"))
  
  enriched <- mutate(newdata, datetime =as.POSIXct(paste(Date, Time), 
                                                   format="%d/%m/%Y %H:%M:%S"))
  
  
  
  png(filename="plot4.png", width= 480, height = 480)
  
  par(mfrow=c(2,2))
  
  plot(enriched$datetime, enriched$Global_active_power, col="black", type= "l",
       xlab="", ylab="Global Active Power")
  
  plot(enriched$datetime, enriched$Voltage, col="black", type="l", 
       xlab="datetime", ylab="Voltage")
  
  plot(enriched$datetime, enriched$Sub_metering_1, col="black", type="l", xlab="", 
       ylab="Energy sub metering")
  lines(enriched$datetime, enriched$Sub_metering_2, col="red")
  lines(enriched$datetime, enriched$Sub_metering_3, col="blue")
  
  legend("topright", legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col= c("black", "red", "blue"), lty=1, box.lty = 0 )
  box(which = "plot", lty="solid", col="black")
  
  plot(enriched$datetime, enriched$Global_reactive_power, col="black", type="l", 
       xlab="datetime", ylab="Global_reactive_power")
  
  
  dev.off()
}