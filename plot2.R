library(lubridate)

colTypes <- c(rep("character", 2), rep("numeric", 7))
df <- read.table("household_power_consumption.txt", sep= ";", colClasses=colTypes,na.strings="?", header=TRUE)
df <- subset(df, Date %in% c("1/2/2007", "2/2/2007"))

df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df$Datetime <- df$Date + hms(df$Time)

png("plot2.png", width = 480, height = 480)
plot(df$Datetime, df$Global_active_power, type="l", xlab=NA, ylab="Global Active Power (kilowatts)")
dev.off()