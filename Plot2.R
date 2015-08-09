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
par(mar=c(5,5,2,2))
plot(data$datetime,data$Global_active_power,type='l',ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png,"plot.2.png")
dev.off()
