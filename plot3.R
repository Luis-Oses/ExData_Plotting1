dataset=read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE, dec = ".")

library(dplyr)
subset=filter(dataset, (Date=='1/2/2007' | Date=='2/2/2007'))

date_time <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
SubMetering1 <- as.numeric(subset$Sub_metering_1)
SubMetering2 <- as.numeric(subset$Sub_metering_2)
SubMetering3 <- as.numeric(subset$Sub_metering_3)

#Plot
plot(date_time, SubMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, SubMetering2, type="l", col="red")
lines(date_time, SubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

#Creating PNG
png("plot3.png", width=480, height=480)
plot(date_time, SubMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, SubMetering2, type="l", col="red")
lines(date_time, SubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()


