setwd("E:/OFFICE/DOST Data Science Coursera/DOST - Coursera Data Science - 04 Exploratory Data Analysis/Week 1/Project1/ExData_Plotting1")

household_powerdata <- read.csv("E:/OFFICE/DOST Data Science Coursera/DOST - Coursera Data Science - 04 Exploratory Data Analysis/Week 1/Project1/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                                nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataplot1 <- subset(household_powerdata , Date %in% c("1/2/2007","2/2/2007"))
dataplot1$Date <- as.Date(dataplot1$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(dataplot1$Date), dataplot1$Time)
dataplot1$Datetime <- as.POSIXct(datetime)

with(dataplot1, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})

dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()