#So the plot can be fully reproduced the raw data should be available on the working directory
#The raw data is available on the following adress: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

data<-read.table('household_power_consumption.txt', header=TRUE, sep=";", na.strings = "?", colClasses = c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

#subsets for the two days in analysis
data<-data[(data$Date=="1/2/2007")|(data$Date=="2/2/2007"),]

#concatenate columns "Date" and "Time" on character vector "datetime"
datetime<-paste(data$Date,data$Time, sep=" ")

#changes "datetime" class
datetime<-strptime(datetime, "%d/%m/%Y %H:%M:%S", tz="")

#adds "datetime" column to the original dataframe
data<-cbind(data,datetime)

#plots data
plot(data$datetime, data$Global_active_power, type="l", main="", xlab="", ylab="Global Active Power (kilowatts)")

#copy screen output to PNG file
dev.copy(png, file="plot2.png")

#closes graphic device
dev.off()