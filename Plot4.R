#Read Data
data <- read.csv("~/Exploratory Data Analysis Assignments/ExData_Plotting1/household_power_consumption.txt", sep=";", na.strings="?")

#Subset Data
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data<-data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]

#Combine Data and Time to one column
data$Date<-paste(data$Date,data$Time)
data <- data[,-2]
data$Date<-strptime(data$Date,format="%Y-%m-%d %H:%M:%S")
library(data.table)
setnames(data,old="Date",new="datetime")

png("Plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))

#Draw the required Plot1
plot(data$datetime,data$Global_active_power,type='l',ylab="Global Active Power",xlab="")

#Draw the required Plot2
plot(data$datetime,data$Voltage,type='l',ylab="Voltage",xlab="datetime")


#Draw the required Plot 3
plot(data$datetime,data$Sub_metering_1,type='n',xlab="",ylab="Energy sub metering")
lines(data$datetime,data$Sub_metering_1)
lines(data$datetime,data$Sub_metering_2,col="red")
lines(data$datetime,data$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty='n',cex=0.8,lty=c(1,1,1),col=c("black","red","blue"))

#Draw the required Plot4
plot(data$datetime,data$Global_reactive_power,type='l',ylab="Global_reactive_power",xlab="datetime")

dev.off()
