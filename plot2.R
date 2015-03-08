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
png(filename = "plot2.png")

plot(twoDayData$Time, twoDayData$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type = "l")

dev.off()


 