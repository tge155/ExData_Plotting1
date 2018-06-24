# load the data 
dataset <- read.table("~/Downloads/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# convert the Date variable
dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")

# Subset the data
subset <- dataset[dataset$Date >= "2007-02-01" & dataset$Date <= "2007-02-02",]

# convert Date and Time
subset$DateTime <- strptime(paste(subset$Date, subset$Time), "%Y-%m-%d %H:%M:%S")
subset$DateTime <- as.POSIXct(subset$DateTime)

# plot
png("~/Downloads/plot3.png", width=480, height=480)
plot(subset$Sub_metering_1 ~ subset$DateTime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(subset$Sub_metering_2 ~ subset$DateTime, col = "Red")
lines(subset$Sub_metering_3 ~ subset$DateTime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()