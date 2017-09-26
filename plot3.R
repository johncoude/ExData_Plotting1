df <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
df <- subset(df, Date %in% c("1/2/2007", "2/2/2007"))
df$DateTime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")


png(file="plot3.png",width=480,height=480)
with(df, plot(DateTime, Sub_metering_1, type = "n",
              xlab = "days (in Swedish!)", ylab = "Energy sub metering"))

with(df, lines(DateTime, Sub_metering_1))
with(df, lines(DateTime, Sub_metering_2, col = "red"))
with(df, lines(DateTime, Sub_metering_3, col = "blue"))

legend("topright", lty = c(1,1,1), legend = c("sub metering 1", "sub metering 2", "sub metering 3"),
       col = c("black", "red", "blue"))

dev.off()