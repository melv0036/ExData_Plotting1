#Creates plot of kilowatts vs. frequency for February 1 & 2, 2007

##read raw data
data <- read.csv("household_power_consumption.txt",header = TRUE,sep = ";",na="?")

##subset data, note that data is stored with date first and month second
datasubset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

##add datetime column by combining date and time columns as text and transfroming to datetime
datasubset <- transform(datasubset, DateTime = strptime(paste(Date,Time, sep = " "),format = "%d/%m/%Y %H:%M:%S"))

##plot the data, go straight to png
png(filename = "plot3.png",width = 480, height = 480)
plot(x=(datasubset$DateTime),y=datasubset$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x=(datasubset$DateTime),y=datasubset$Sub_metering_2,col="red")
lines(x=(datasubset$DateTime),y=datasubset$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=2)

##close png device
dev.off()
