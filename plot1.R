#reading data from file
data_f<-read.csv("household_power_consumption.txt",header = TRUE, sep = ";",na.strings="?",nrows =69518)
data_f$Date <-as.Date(data_f$Date, format="%d/%m/%Y")

#Subset data with only dates we need
data <- subset(data_f, data_f$Date>="2007/2/1" & data_f$Date <="2007/2/2")

#Plotting and annotating

hist(data$Global_active_power,main="Global active power", xlab="Global Active Power (kilowatts)", 
     ylab="Frequency",col = "red")

# Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
