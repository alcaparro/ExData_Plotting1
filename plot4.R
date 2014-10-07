data<-read.table("household_power_consumption.txt", header=TRUE, sep=";" )
data$DateTime<-strptime(paste(data$Date, data$Time, sep=" "),  "%d/%m/%Y %H:%M:%S")
dataSmall<-data[data$DateTime>="2007-02-01" & data$DateTime<"2007-02-03",]
rm(data)

png(filename = "plot4.png",width = 480, height = 480, units = "px")

par(mfrow = c(2, 2))
plot(dataSmall$DateTime,as.numeric(as.character(dataSmall$Global_active_power)),  type="l",
  main = "", ylab="Global Active Power ", xlab="")
plot(dataSmall$DateTime,as.numeric(as.character(dataSmall$Voltage)),  type="l",
  main = "", ylab="Voltage", xlab="datetime")
plot(dataSmall$DateTime,as.numeric(as.character(dataSmall$Sub_metering_1)),  type="l",
  main = "", ylab="Energy sub metering", xlab="", )
lines(dataSmall$DateTime, as.numeric(as.character(dataSmall$Sub_metering_2)), col="red")
lines(dataSmall$DateTime, as.numeric(as.character(dataSmall$Sub_metering_3)), col="blue")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , 
  lty=1, col=c('black', 'red', 'blue'), cex=.75, bty="n")
plot(dataSmall$DateTime,as.numeric(as.character(dataSmall$Global_reactive_power)),  type="l",
  main = "", ylab="Global_reactive_power", xlab="datetime")

dev.off()     
    