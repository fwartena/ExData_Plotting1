## First set the working directory to the location of this file
## And make sure the data has been unzipped in this directory

## load the data set
data <- read.csv2("./exdata-data-household_power_consumption/household_power_consumption.txt", na.strings="?", dec=".", stringsAsFactors = FALSE)

# filter the data to include only the dates 2007-02-01 and 2007-02-02
data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

## change the date and time columns to a DateTime column
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

## Set the locale to English to make sure the day abbreviations show as English days
Sys.setlocale("LC_TIME", "English")

## open the png device to save the plot as plot3.png
png(file = "plot4.png", width = 480, height = 480)

## set the plotting options to have 2 rows and 2 columns
par(mfrow = c(2, 2), cex=0.8)

## create the fourth plot which is are 4 different plots in one

## plot 1 Global active power over time
plot(data$DateTime, data$Global_active_power, type = "l", main = "", xlab = "", ylab = "Global Active Power")

## plot 2 Voltage over time
plot(data$DateTime, data$Voltage, type = "l", main = "", xlab = "datetime", ylab = "Voltage")

## plot 3 energy sub metering over time
plot(data$DateTime, data$Sub_metering_1, type = "l", main = "", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", lwd = "1", bty = "n", cex = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## plot 4 Global reactive power over time
plot(data$DateTime, data$Global_reactive_power, type = "l", main = "", xlab = "datetime", ylab = "Global_reactive_power")

## turn off the png device
dev.off()
