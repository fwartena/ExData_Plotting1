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
par(mfrow=c(1,1), cex=1)
png(file = "plot3.png", width = 480, height = 480)

## create the third plot which is a plot of the three sub meterings over time
plot(data$DateTime, data$Sub_metering_1, type = "l", main = "", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", lwd = "1", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## turn off the png device
dev.off()
