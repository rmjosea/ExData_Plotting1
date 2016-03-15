# First Of all set our working directory
setwd('/home/jose/proyectos/coursera/exploratoryDataAnalysis/ExData_Plotting1')
#Read File
sourceFile <- file("sourceFiles/household_power_consumption.txt")
consumo <- read.table(text = grep("^[1,2]/2/2007", readLines(sourceFile), value = TRUE), col.names = c("Date", "Time", "GlobalActivePower", "GlobalReactivePower", "Voltage", "Global_intensity", "SubMetering1", "SubMetering2", "SubMetering3"), sep = ";", header = TRUE)
#Format Date
consumo$Date <- as.Date(consumo$Date, format = "%d/%m/%Y")
## Converting dates
datetime <- paste(as.Date(consumo$Date), consumo$Time)
consumo$DateTime <- as.POSIXct(datetime)
# open device
png(filename='plots/plot4.png',width=480,height=480,units='px')
# 4 figures arranged in 2 rows and 2 columns
par(mfrow=c(2,2))
#Generating Plot 1
plot(consumo$GlobalActivePower ~ consumo$DateTime, type = "l", ylab = "Global Active Power", xlab = "")
#Generating Plot 2
plot(consumo$Voltage ~ consumo$DateTime, type = "l", ylab = "Voltage", xlab = "datetime")
## Generating Plot 3
plot(consumo$SubMetering1 ~ consumo$DateTime ,type='l',col='Black',xlab='',ylab='Energy sub metering')
lines(consumo$SubMetering2 ~ consumo$DateTime,col="Red")
lines(consumo$SubMetering3 ~ consumo$DateTime,col="Blue")
#legend of graph
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))
##Generation Plot4
plot(consumo$GlobalReactivePower ~ consumo$DateTime, type = "l", ylab = "Global_rective_power", xlab = "datetime")
# Turn off device
x<-dev.off()