## First set the working directory to the location of this file
## And make sure the data has been unzipped in this directory

## load the data set
data <- read.csv2("./exdata-data-household_power_consumption/household_power_consumption.txt", na.strings="?", dec=".", stringsAsFactors = FALSE)

# filter the data to include only the dates 2007-02-01 and 2007-02-02
data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

## change the date and time columns to a DateTime column
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

## create the first plot which is a histogram of Global Active Power
par(mfrow=c(1,1), cex=0.8)
png(file = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
