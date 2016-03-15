# First Of all set our working directory
setwd('/home/jose/proyectos/coursera/exploratoryDataAnalysis/ExData_Plotting1')
#Read File
sourceFile <- file("sourceFiles/household_power_consumption.txt")
consumo <- read.table(text = grep("^[1,2]/2/2007", readLines(sourceFile), value = TRUE), col.names = c("Date", "Time", "GlobalActivePower", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
#Format Date
consumo$Date <- as.Date(consumo$Date, format = "%d/%m/%Y")
# open device
png(filename='plots/plot1.png',width=480,height=480,units='px')
#Plot Graph1
hist(consumo$GlobalActivePower,main=paste('Global active power'),xlab='Global Active Power (kilowatts)',col='red')

# Turn off device
x<-dev.off()