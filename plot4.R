data_all <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                       na.strings = "?", comment.char = "", quote = '\"')
data_all$Date <- as.Date(data_all$Date, format = "%d/%m/%Y")
data <- subset(data_all, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
write.csv(data, file = "two_days_power.csv")

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(data, {
        plot(Global_active_power ~ Datetime, type = "l", 
             ylab = "Global Active Power", xlab = "")
        plot(Voltage ~ Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
        plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering",
             xlab = "")
        lines(Sub_metering_2 ~ Datetime, col = 'Red')
        lines(Sub_metering_3 ~ Datetime, col = 'Blue')
        legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
               bty = "n",
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power ~ Datetime, type = "l", 
             ylab = "Global_reactive_power", xlab = "datetime")
})
dev.copy(png,'plot4.png', width = 480, height = 480)
dev.off()