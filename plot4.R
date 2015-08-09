
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


png(file = "plot4.png", units="px", height=480, width=480)
par(mfrow = c(2, 2))
with(pow, {

plot(pow$datetime, pow$Global_active_power, type="n", main = "",xlab="",ylab="Global active power",
col="black")
lines(pow$datetime, pow$Global_active_power)

plot(pow$datetime, pow$Voltage, type="n", main = "",xlab="datetime",ylab="Voltage",
col="black")
lines(pow$datetime, pow$Voltage)

plot(pow$datetime, pow$Sub_metering_1, type="n", main = "",xlab="",ylab="Energy sub metering", ylim=c(0,40))
lines(pow$datetime, pow$Sub_metering_1, col="black")
lines(pow$datetime, pow$Sub_metering_2, col="red")
lines(pow$datetime, pow$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1))

plot(pow$datetime, pow$Global_reactive_power, type="n", main = "",xlab="datetime",ylab="Global reactive power",
col="black")
lines(pow$datetime, pow$Global_reactive_power)
})

dev.off()


