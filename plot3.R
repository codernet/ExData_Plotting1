# Read data from file
consumptionData <- read.table("./household_power_consumption.txt", sep = ";",
                              header = TRUE, na.strings ="?")

# Extract data for 2007-02-01 and 2007-02-02
twoDayData <- consumptionData[(consumptionData$Date=="1/2/2007" | consumptionData$Date=="2/2/2007"),]

# Combine date and time
twoDayData$Time <- paste(twoDayData$Date, twoDayData$Time, sep = " ")

# Convert time string to time object
twoDayData$Time <- strptime(twoDayData$Time, "%d/%m/%Y %H:%M:%S")

# Plot to PNG, default dimension is 480px * 480px
png(filename = "plot3.png")

plot(twoDayData$Time, twoDayData$Sub_metering_1, xlab="", ylab="Energy sub metering", type = "n")
lines(twoDayData$Time, twoDayData$Sub_metering_1, col="black")
lines(twoDayData$Time, twoDayData$Sub_metering_2, col="red")
lines(twoDayData$Time, twoDayData$Sub_metering_3, col="blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 'solid')

dev.off()


 