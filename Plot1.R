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

#Plot the required Histogram
par(mar=c(5,5,2,2))
hist(data[,2],xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power")
dev.copy(png,"plot1.png")
dev.off()
