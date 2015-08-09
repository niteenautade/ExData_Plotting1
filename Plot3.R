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

#Draw the required Plot 
par(mar=c(5,5,2,1))
png("plot3.png",width = 480, height = 480)
plot(data$datetime,data$Sub_metering_1,type='n',xlab="",ylab="Energy sub metering")
lines(data$datetime,data$Sub_metering_1)
lines(data$datetime,data$Sub_metering_2,col="red")
lines(data$datetime,data$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.6,lty=c(1,1,1),col=c("black","red","blue"))
dev.off()
