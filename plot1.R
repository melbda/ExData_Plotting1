##Code for Plot 1

##library(varhandle)
setwd("E:/Coursera/ExploratoryDataAnalysis")
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,dec=".")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
setwd("E:/Coursera/ExploratoryDataAnalysis/ExData_Plotting1")

date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")
datasub <- data[data$Date %in% date1:date2,]

datasub$Global_active_power <- unfactor(datasub$Global_active_power)
datasub$Global_active_power <- as.numeric(datasub$Global_active_power)

finaldata <- datasub[datasub$Global_active_power != "?",]

library(datasets)
with(finaldata, hist(Global_active_power, col = "red"
                ,main = "Global Active Power"
                ,xlab = "Global Active Power (kilowatts)"
                ,breaks = 15))
dev.copy(png, file = "plot1.png") ##copy hist of a PNG file

dev.off()