library(dplyr); library(readr); library(tidyr); library(lubridate)

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "data.zip", method = "curl")
unzip("data.zip")
data <- read_csv2("household_power_consumption.txt", col_names = TRUE, na = "?")
data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

data$Date <- dmy(data$Date)
data$Datetime <- as.POSIXct(paste(as.Date(data$Date), data$Time))

par(mfrow = c(1,1))

with(data, plot(Sub_metering_1~Datetime, type = "l", 
		ylab = "Energy sub metering", xlab = ""))
with(data, lines(Sub_metering_2~Datetime, type = "l", col = "red"))
with(data, lines(Sub_metering_3~Datetime, type = "l", col = "blue"))

legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = paste("Sub_metering_", 1:3))

dev.copy(png, "plot3.png", height = 480, width = 480)
dev.off()