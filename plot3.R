##Code for Plot 3

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

datasub$Sub_metering_1 <- unfactor(datasub$Sub_metering_1)
datasub$Sub_metering_1 <- as.numeric(datasub$Sub_metering_1)
datasub <- datasub[datasub$Sub_metering_1 != "?",]

datasub$Sub_metering_2 <- unfactor(datasub$Sub_metering_2)
datasub$Sub_metering_2 <- as.numeric(datasub$Sub_metering_2)
datasub <- datasub[datasub$Sub_metering_2 != "?",]

datasub$Time <- unfactor(datasub$Time)
finaldata <- datasub[datasub$Global_active_power != "?",]
finaldata <- datasub[datasub$Sub_metering_1 != "?",]
finaldata <- datasub[datasub$Sub_metering_2 != "?",]
finaldata <- datasub[datasub$Sub_metering_3 != "?",]
finaldataplot3 <- gather(finaldata, Energy_sub_metering
                         , Watt_energy, Sub_metering_1:Sub_metering_3)

finaldataplot3$datetime = paste(finaldataplot3$Date, finaldataplot3$Time, sep = " ")
finaldataplot3$datetime <- strptime(finaldataplot3$datetime, format = "%Y-%m-%d %H:%M:%S")


library(datasets)
with(finaldataplot3, plot(datetime, Watt_energy, type = "n"
                     ,xlab = ""
                     ,ylab = "Energy sub metering"), pch = "")

with(subset(finaldataplot3, Energy_sub_metering == "Sub_metering_1"), 
     points(datetime, Watt_energy, col = "black", pch = ""), pch = "")
with(subset(finaldataplot3, Energy_sub_metering == "Sub_metering_1"), 
     lines(datetime, Watt_energy, col = "black"))

with(subset(finaldataplot3, Energy_sub_metering == "Sub_metering_2"), 
     points(datetime, Watt_energy, col = "red", pch = ""), pch = "")
with(subset(finaldataplot3, Energy_sub_metering == "Sub_metering_2"), 
     lines(datetime, Watt_energy, col = "red"))

with(subset(finaldataplot3, Energy_sub_metering == "Sub_metering_3"), 
     points(datetime, Watt_energy, col = "blue", pch = ""), pch = "")
with(subset(finaldataplot3, Energy_sub_metering == "Sub_metering_3"), 
     lines(datetime, Watt_energy, col = "blue"))

legend("topright", pch="-", col=c("black","red","blue")
       ,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png, file = "plot3.png")
dev.off()

