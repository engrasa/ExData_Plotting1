setwd("E:/OFFICE/DOST Data Science Coursera/DOST - Coursera Data Science - 04 Exploratory Data Analysis/Week 1/Project1/ExData_Plotting1")

household_powerdata <- read.csv("E:/OFFICE/DOST Data Science Coursera/DOST - Coursera Data Science - 04 Exploratory Data Analysis/Week 1/Project1/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

dataplot1 <- subset(household_powerdata , Date %in% c("1/2/2007","2/2/2007"))
dataplot1$Date <- as.Date(dataplot1$Date, format="%d/%m/%Y")
hist(dataplot1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()