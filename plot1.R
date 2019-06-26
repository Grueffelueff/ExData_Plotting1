plot1 <- function(){
  library(dplyr)
  data <- read.csv(file="household_power_consumption.txt", sep=";", header=TRUE, 
                   na.strings="?")
  newdata <- subset(data, (Date=="1/2/2007"|Date=="2/2/2007"))
  
  png(filename="plot1.png", width= 480, height = 480)
  hist(newdata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", 
       main="Global Active Power")
  dev.off()
}