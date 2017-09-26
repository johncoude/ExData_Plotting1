df <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
df <- subset(df, Date %in% c("1/2/2007", "2/2/2007"))
df$DateTime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")


png(file="plot2.png",width=480,height=480)
with(df, plot(DateTime, Global_active_power, type = "l",
              xlab = "days (in Swedish!)", ylab = "Global active power"))

dev.off()