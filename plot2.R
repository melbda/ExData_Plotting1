##Code for Plot 2

##library(varhandle)
setwd("E:/Coursera/ExploratoryDataAnalysis")

data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,dec=".")

setwd("E:/Coursera/ExploratoryDataAnalysis/ExData_Plotting1")

data$Date <- as.Date(data$Date, "%d/%m/%Y")
date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")
datasub <- data[data$Date %in% date1:date2,]
datasub$Global_active_power <- unfactor(datasub$Global_active_power)
datasub$Global_active_power <- as.numeric(datasub$Global_active_power)
datasub <- datasub[datasub$Global_active_power != "?",]
datasub$Time <- unfactor(datasub$Time)
finaldata <- datasub[datasub$Global_active_power != "?",]
finaldata$datetime = paste(finaldata$Date, finaldata$Time, sep = " ")
finaldata$datetime <- strptime(finaldata$datetime, format = "%Y-%m-%d %H:%M:%S")
library(datasets)
with(finaldata, plot(datetime, Global_active_power, pch = "",
                     ,xlab = ""
                     ,ylab = "Global Active Power (kilowatts)"))
with(finaldata, lines(datetime, Global_active_power))
dev.copy(png, file = "plot2.png")
dev.off()