data_all <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                       na.strings = "?", comment.char = "", quote = '\"')
data_all$Date <- as.Date(data_all$Date, format = "%d/%m/%Y")
data <- subset(data_all, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
write.csv(data, file = "two_days_power.csv")

hist(data$Global_active_power, col = "red", main = paste("Global Active Power"), 
     xlab = "Global Active Power (kilowatts)")
dev.copy(png,'plot1.png', width = 480, height = 480)
dev.off()