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
png("~/Downloads/plot2.png", width=480, height=480)
plot(subset$Global_active_power ~ subset$DateTime, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()