########################################################################################
## Read in the big file
library(data.table)
fread("household_power_consumption.txt") -> data

########################################################################################
## Subset relevant dates
data <- data[data$Date %in% c('1/2/2007','2/2/2007'),]

########################################################################################
## Cleaned data
gap <- as.numeric(data$Global_active_power)
DateTime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
SM1 <- as.numeric(data$Sub_metering_1)
SM2 <- as.numeric(data$Sub_metering_2)
SM3 <- as.numeric(data$Sub_metering_3)
volt <- as.numeric(data$Voltage)
grp <- as.numeric(data$Global_reactive_power)

########################################################################################
## plot 4
png("plot4.png",width=480,height=480)

## 4 panels 2x2
par(mfrow=c(2,2))

# Quad 1 - NW
plot(DateTime, gap, ylab="Global Active Power", xlab="", type="l")

# Quad 2 - NE
plot(DateTime, volt, ylab="Voltage", xlab="datetime", type="l")

# Quad 3 - SW
plot(DateTime, SM1, ylab="Energy sub metering", xlab="", type="l")
lines(DateTime, SM2, col="red", type="l")
lines(DateTime, SM3, col="blue", type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, bty="n", col=c("black","red","blue"))

# Quad 4 - SE
plot(DateTime, grp, ylab="Global_reactive_power", xlab="datetime", type="l")

dev.off()
