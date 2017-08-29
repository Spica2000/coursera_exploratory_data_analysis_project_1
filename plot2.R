#reading data from file
data_f<-read.csv("household_power_consumption.txt",header = TRUE, sep = ";",na.strings="?",nrows =69518)
data_f$Date <-as.Date(data_f$Date, format="%d/%m/%Y")

#Subset data with only dates we need
data <- subset(data_f, data_f$Date>="2007/2/1" & data_f$Date <="2007/2/2")

#Convert dates
dt <- paste(as.Date(data$Date), data$Time)
data$dt <- as.POSIXct(dt)

#Plotting and annotating

plot(data$Global_active_power~data$dt,type="l",ylab="Global Active Power (kilowatts)",xlab="",)

# Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
