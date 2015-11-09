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
## plot 2
png("plot2.png",width=480,height=480)
plot(DateTime, gap, ylab="Global Active Power (kilowats)", xlab="", type="l")
dev.off()
