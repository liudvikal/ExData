
data<-read.table('household_power_consumption.txt', header = TRUE, sep = ";")
pow<-data[data$Date=='1/2/2007'|data$Date=='2/2/2007',]
pow$x <- paste(pow$Date, pow$Time)
pow$datetime<-strptime(pow$x, "%d/%m/%Y %H:%M:%S")
pow$Global_active_power<-as.numeric(pow$Global_active_power)/1000
pow$Global_reactive_power<-as.numeric(pow$Global_reactive_power)/1000
pow$Voltage<-as.numeric(pow$Voltage)
pow$Sub_metering_1<-as.numeric(pow$Sub_metering_1)
pow$Sub_metering_2<-as.numeric(pow$Sub_metering_2)
pow$Sub_metering_3<-as.numeric(pow$Sub_metering_3)

png(file = "plot2.png", units="px", height=480, width=480)
plot(pow$datetime, pow$Global_active_power, type="n", main = "",xlab="",ylab="Global active power (kilowatts)",
col="black")
lines(pow$datetime, pow$Global_active_power)
dev.off()