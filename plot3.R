#### Plot 3 ######

setwd("~/Downloads")

data=read.table("household_power_consumption.txt",header = TRUE,
                sep = ";", na.strings = "?", stringsAsFactors=FALSE)

data$datetime = with(data, as.POSIXct(paste(Date,Time), 
                                      format="%d/%m/%Y %H:%M:%S"))

subdata=subset(data, datetime>="2007/02/01 00:00:00" & datetime<="2007/02/02 23:59:59")

png("plot3.png",480,480)

with(subdata, plot( datetime, Sub_metering_1,type = "l", col = "black", 
                   xlab="", ylab = "Energy sub metering"))
lines(subdata$Sub_metering_2~subdata$datetime, col="red", lty=1)
lines(subdata$Sub_metering_3~subdata$datetime, col="blue", lty=1)
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black","red","blue"), lty = c(1,1,1))
dev.off()