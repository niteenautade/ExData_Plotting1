data <- read.csv("~/Exploratory Data Analysis Assignments/ExData_Plotting1/household_power_consumption.txt", sep=";", na.strings="?")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data<-data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]
data$Date<-paste(data$Date,data$Time)
data <- data[,-2]
data$Date<-strptime(data$Date,format="%Y-%m-%d %H:%M:%S")
library(data.table)
setnames(data,old="Date",new="datetime")
