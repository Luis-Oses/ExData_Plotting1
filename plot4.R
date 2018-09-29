dataset=read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE, dec = ".")

library(dplyr)
subset=filter(dataset, (Date=='1/2/2007' | Date=='2/2/2007'))

date_time <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

GAP = as.numeric(subset$Global_active_power)

V = as.numeric(subset$Voltage)

SubMetering1 <- as.numeric(subset$Sub_metering_1)
SubMetering2 <- as.numeric(subset$Sub_metering_2)
SubMetering3 <- as.numeric(subset$Sub_metering_3)

GRP = as.numeric(subset$Global_reactive_power)

#Plot
par(mfrow = c(2, 2))

##Global Active Power
plot(date_time, GAP, type="l", ylab="Global Active Power", xlab="")

##Voltage
plot(date_time, V, type="l", ylab="Voltage", xlab="datetime")

##Energy Sub metering
plot(date_time, SubMetering1, type="l", ylab="Energy Sub metering", xlab="")
lines(date_time, SubMetering2, type="l", col="red")
lines(date_time, SubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

##Global Reactive Power
plot(date_time, GRP, type="l", ylab="Global Reactive Power", xlab="datetime")




#Creating PNG
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

##Global Active Power
plot(date_time, GAP, type="l", ylab="Global Active Power", xlab="")

##Voltage
plot(date_time, V, type="l", ylab="Voltage", xlab="datetime")

##Energy Sub metering
plot(date_time, SubMetering1, type="l", ylab="Energy Sub metering", xlab="")
lines(date_time, SubMetering2, type="l", col="red")
lines(date_time, SubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

##Global Reactive Power
plot(date_time, GRP, type="l", ylab="Global Reactive Power", xlab="datetime")
dev.off()


