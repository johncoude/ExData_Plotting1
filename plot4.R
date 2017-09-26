df <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
df <- subset(df, Date %in% c("1/2/2007", "2/2/2007"))
df$DateTime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")


png(file="plot4.png",width=480,height=480)
par(mfrow = c(2,2), mar = c(4,4,3,1))
with(df, {
        
        plot(DateTime, Global_active_power, type = "l",
              xlab = "", ylab = "Global active power (kilowatts)")
        
        plot(DateTime, Voltage, type = "l", xlab = "DateTime")
        
        plot(DateTime, Sub_metering_1, type = "n",
             xlab = "", ylab = "Energy sub metering")
        lines(DateTime, Sub_metering_1)
        lines(DateTime, Sub_metering_2, col = "red")
        lines(DateTime, Sub_metering_3, col = "blue")
        legend("topright", lty = c(1,1,1), legend = c("sub metering 1", "sub metering 2", "sub metering 3"),
               col = c("black", "red", "blue"))
        
        plot(DateTime, Global_reactive_power, type = "l", xlab = "DateTime")
}
        )


dev.off()