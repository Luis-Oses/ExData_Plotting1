dataset=read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE, dec = ".")

library(dplyr)
subset=filter(dataset, (Date=='1/2/2007' | Date=='2/2/2007'))

date_time <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(subset$Global_active_power)

#Plot
plot(date_time, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Creating PNG
png("plot2.png", width=480, height=480)
plot(date_time, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
