data_all <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                       na.strings = "?", comment.char = "", quote = '\"')
data_all$Date <- as.Date(data_all$Date, format = "%d/%m/%Y")
data <- subset(data_all, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
write.csv(data, file = "two_days_power.csv")

with(data, {
        plot(Sub_metering_1 ~ Datetime, type = "l", 
             ylab = "Global Active Power (kilowatts)", xlab = "")
        lines(Sub_metering_2 ~ Datetime, col = 'Red')
        lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png,'plot3.png', width = 480, height = 480)
dev.off()