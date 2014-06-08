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
