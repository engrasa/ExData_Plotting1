setwd("E:/OFFICE/DOST Data Science Coursera/DOST - Coursera Data Science - 04 Exploratory Data Analysis/Week 1/Project1/ExData_Plotting1")

household_powerdata <- read.csv("E:/OFFICE/DOST Data Science Coursera/DOST - Coursera Data Science - 04 Exploratory Data Analysis/Week 1/Project1/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                                nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataplot1 <- subset(household_powerdata , Date %in% c("1/2/2007","2/2/2007"))
dataplot1$Date <- as.Date(dataplot1$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(dataplot1$Date), dataplot1$Time)
dataplot1$Datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(dataplot1, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="datetime")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="datetime")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global_rective_power",xlab="datetime")
})

dev.copy(png, file = "plot4.png", width=480, height=480)
dev.off()