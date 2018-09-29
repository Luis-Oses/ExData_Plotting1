dataset=read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE, dec = ".")

library(dplyr)
subset=filter(dataset, (Date=='1/2/2007' | Date=='2/2/2007'))

GAP = as.numeric(subset$Global_active_power)

#Histogram
hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Creating PNG
png("plot1.png", width=480, height=480)
hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()



