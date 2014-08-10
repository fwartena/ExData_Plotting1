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

## create the second plot which is a plot of global active power over time
par(mfrow=c(1,1), cex=0.8)
png(file = "plot2.png", width = 480, height = 480)
plot(data$DateTime, data$Global_active_power, type = "l", main = "", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
