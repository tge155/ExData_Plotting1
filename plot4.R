# load the data 
dataset <- read.table("~/Downloads/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# convert the Date variable
dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")

# Subset the data
subset <- dataset[dataset$Date >= "2007-02-01" & dataset$Date <= "2007-02-02",]

# convert Date and Time
datetime <- strptime(paste(subset$Date, subset$Time), "%Y-%m-%d %H:%M:%S")
datetime <- as.POSIXct(datetime)

# plot
png("~/Downloads/plot4.png", width=480, height=480)

par(mfrow = c(2,2))

plot(subset$Global_active_power ~ datetime, type = "l", ylab = "Global Active Power", xlab = "")

plot(subset$Voltage ~ datetime, type = "l")

plot(subset$Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(subset$Sub_metering_2 ~ datetime, col = "Red")
lines(subset$Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

plot(subset$Global_active_power ~ datetime, type = "l")

dev.off()