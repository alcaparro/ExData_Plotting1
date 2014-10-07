data<-read.table("household_power_consumption.txt", header=TRUE, sep=";" )
data$DateTime<-strptime(paste(data$Date, data$Time, sep=" "),  "%d/%m/%Y %H:%M:%S")
dataSmall<-data[data$DateTime>="2007-02-01" & data$DateTime<"2007-02-03",]
rm(data)


png(filename = "plot1.png",
    width = 480, height = 480, units = "px")
hist(as.numeric(as.character(dataSmall$Global_active_power)), col="red",
     main = "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
