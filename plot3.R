plot3 <- function(){
  library(dplyr)
  data <- read.csv(file="household_power_consumption.txt", sep=";", header=TRUE, 
                   na.strings="?")
  newdata <- subset(data, (Date=="1/2/2007"|Date=="2/2/2007"))
  
  enriched <- mutate(newdata, datetime =as.POSIXct(paste(Date, Time), 
                                                   format="%d/%m/%Y %H:%M:%S"))
  
  
  
  png(filename="plot3.png", width= 480, height = 480)
  
  plot(enriched$datetime, enriched$Sub_metering_1, col="black", type="l", xlab="", 
       ylab="Energy sub metering")
  lines(enriched$datetime, enriched$Sub_metering_2, col="red")
  lines(enriched$datetime, enriched$Sub_metering_3, col="blue")
  
  legend("topright", legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col= c("black", "red", "blue"), lty=1 )
  
  
  dev.off()
}