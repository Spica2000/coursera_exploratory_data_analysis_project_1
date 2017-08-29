#reading data from file
data_f<-read.csv("household_power_consumption.txt",header = TRUE, sep = ";",na.strings="?",nrows =69518)
data_f$Date <-as.Date(data_f$Date, format="%d/%m/%Y")

#Subset data with only dates we need
data <- subset(data_f, data_f$Date>="2007/2/1" & data_f$Date <="2007/2/2")

#Convert dates
dt <- paste(as.Date(data$Date), data$Time)
data$dt <- as.POSIXct(dt)

#Plotting and annotating
par(mfrow=c(2,2))
with(data, {
    plot(data$Global_active_power~data$dt,type="l",ylab="Global Active Power (kilowatts)",xlab="",)
    plot(data$Voltage~data$dt,type="l",ylab="Voltage",xlab="datetime",)
    plot(Sub_metering_1~dt, type="l",ylab="Energy sub-metering", xlab="")
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
          legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    lines(Sub_metering_2~dt,col='Red')
    lines(Sub_metering_3~dt,col='Blue')
    plot(data$Global_reactive_power~data$dt,type="l",ylab="Global_Reactive_Power",xlab="",)
})


# Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
