#Creates plot of kilowatts vs. frequency for February 1 & 2, 2007

##read raw data
data <- read.csv("household_power_consumption.txt",header = TRUE,sep = ";",na="?")

##subset data, note that data is stored with date first and month second
datasubset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

##add datetime column by combining date and time columns as text and transfroming to datetime
datasubset <- transform(datasubset, DateTime = strptime(paste(Date,Time, sep = " "),format = "%d/%m/%Y %H:%M:%S"))

##plot the data, go straight to png
png(filename = "plot2.png",width = 480, height = 480)
plot(datasubset$DateTime,datasubset$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="Date/TIme")

##close png device
dev.off()
