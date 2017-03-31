#### Plot 2 ######

setwd("~/Downloads")

data=read.table("household_power_consumption.txt",header = TRUE,
                sep = ";", na.strings = "?", stringsAsFactors=FALSE)

data$datetime = with(data, as.POSIXct(paste(Date,Time), 
                                      format="%d/%m/%Y %H:%M:%S"))

subdata=subset(data, datetime>="2007/02/01 00:00:00" & datetime<="2007/02/02 23:59:59")

png("plot2.png",480,480)

with(subdata,plot(datetime,Global_active_power,type="l", xlab="", ylab = "Global Active Power (kilowatts)"))

dev.off()
