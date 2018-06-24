# load the data 
dataset <- read.table("~/Downloads/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# convert the Date variable
dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")

# Subset the data
subset <- dataset[dataset$Date >= "2007-02-01" & dataset$Date <= "2007-02-02",]

# convert Time
subset$Time <- strptime(subset$Time, "%H:%M:%S")

# plot
png("~/Downloads/plot1.png", width=480, height=480)
hist(as.numeric(subset$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()