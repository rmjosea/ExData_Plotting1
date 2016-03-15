# First Of all set our working directory
setwd('/home/jose/proyectos/coursera/exploratoryDataAnalysis/ExData_Plotting1')
#Read File
sourceFile <- file("sourceFiles/household_power_consumption.txt")
consumo <- read.table(text = grep("^[1,2]/2/2007", readLines(sourceFile), value = TRUE), col.names = c("Date", "Time", "GlobalActivePower", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
#Format Date
consumo$Date <- as.Date(consumo$Date, format = "%d/%m/%Y")
## Converting dates
datetime <- paste(as.Date(consumo$Date), consumo$Time)
consumo$Datetime <- as.POSIXct(datetime)
# open device
png(filename='plots/plot2.png',width=480,height=480,units='px')
## Generating Plot 2
plot(consumo$GlobalActivePower ~ consumo$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# Turn off device
x<-dev.off()