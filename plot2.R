data<-read.table("household_power_consumption.txt", header=TRUE, sep=";" )
data$DateTime<-strptime(paste(data$Date, data$Time, sep=" "),  "%d/%m/%Y %H:%M:%S")
dataSmall<-data[data$DateTime>="2007-02-01" & data$DateTime<"2007-02-03",]
rm(data)

png(filename = "plot2.png",
    width = 480, height = 480, units = "px")
plot(dataSmall$DateTime,as.numeric(as.character(dataSmall$Global_active_power)),  type="l",
     main = "", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()     