library(lubridate)

colTypes <- c(rep("character", 2), rep("numeric", 7))
df <- read.table("household_power_consumption.txt", sep= ";", colClasses=colTypes,na.strings="?", header=TRUE)
df <- subset(df, Date %in% c("1/2/2007", "2/2/2007"))

df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df$Datetime <- df$Date + hms(df$Time)

png("plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))
plot(df$Datetime, df$Global_active_power, type="l", xlab=NA, ylab="Global Active Power")

colors = c("black", "red", "blue")
matplot(y=df[7:9], x=df$Datetime, type="l", ylab="Engery sub metering", xlab=NA, col=colors,lty=1)
legend("topright", legend=names(df[7:9]), col=colors, lwd=1, bty="n")

plot(df$Datetime, df$Voltage, type="l", lty=1, xlab="datetime", ylab="Voltage")
plot(df$Datetime, df$Global_reactive_power, type="l", lty=1, xlab="datetime", ylab="Global Reactive Power")

dev.off()

