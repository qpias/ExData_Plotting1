#read data
data <- read.csv("household_power_consumption.txt", sep=';', header=TRUE)
#transform dates into Date type first...
data$Date <- as.Date(data$Date,format='%d/%m/%Y')
#... so we can handle the required days only
data <- data[data$Date >= as.Date('2007-02-01') & data$Date <= as.Date('2007-02-02'),]
#transform other needed fields into correct types
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
#combine date & time into a new combo field
data$DateTime <- paste(as.character(data$Date), as.character(data$Time), sep=" ")
data$DateTime <- strptime(data$DateTime,format="%Y-%m-%d %H:%M:%S")
#plot1
png("plot1.png",width=480,height=480,units="px")
hist(data$Global_active_power,main="Global Active Power", xlab="Global Active Power (kilowatts)",col="red")
dev.off()
#hist 2
png("plot2.png",width=480,height=480,units="px")
with(data,plot(DateTime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()
#hist 3
png("plot3.png",width=480,height=480,units="px")
plot(data$DateTime,data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=1,col=c('black','red','blue'),bg='white')
dev.off()
#hist 4
png("plot4.png",width=480,height=480,units="px")
par(mfrow=c(2,2))
#plot 1
with(data,plot(DateTime,Global_active_power,type="l",ylab="Global Active Power",xlab=""))
#plot 2
plot(data$DateTime,data$Voltage,type="l",ylab="Voltage",xlab="datetime")
#plot 3
plot(data$DateTime,data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=1,col=c('black','red','blue'),bg='white',bty='n')
#plot 4
plot(data$DateTime,data$Global_reactive_power,type="l",ylab="Global_Reactive_Power", xlab="datetime")
dev.off()


