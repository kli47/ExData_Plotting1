library(dplyr); library(readr); library(tidyr)

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "data.zip", method = "curl")
unzip("data.zip")
data <- read_csv2("household_power_consumption.txt", col_names = TRUE, na = "?")
data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

data$Global_active_power <- as.numeric(data$Global_active_power)

par(mfrow = c(1,1))

hist(data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.copy(png, "plot1.png", height = 480, width = 480)
dev.off()