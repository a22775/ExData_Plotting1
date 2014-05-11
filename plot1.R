#So the plot can be fully reproduced the raw data should be available on the working directory
#The raw data is available on the following adress: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

data<-read.table('household_power_consumption.txt', header=TRUE, sep=";", na.strings = "?", colClasses = c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

#subsets for the two days in analysis
data<-data[(data$Date=="1/2/2007")|(data$Date=="2/2/2007"),]

#plots the histogram
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

#copy screen output to PNG file
dev.copy(png, file="plot1.png")

#closes graphic device
dev.off()