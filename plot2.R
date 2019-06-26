plot2 <- function(){
  library(dplyr)
  data <- read.csv(file="household_power_consumption.txt", sep=";", header=TRUE, 
                   na.strings="?")
  newdata <- subset(data, (Date=="1/2/2007"|Date=="2/2/2007"))
  
  enriched <- mutate(newdata, datetime =as.POSIXct(paste(Date, Time), 
                                                   format="%d/%m/%Y %H:%M:%S"))
  
  
  png(filename="plot2.png", width= 480, height = 480)
  plot(enriched$datetime, enriched$Global_active_power, type="l", xlab="", 
       ylab="Global Active Power (kilowatts)")
  
  
  dev.off()
}