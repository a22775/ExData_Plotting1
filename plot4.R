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


par(mfcol=c(2,2))


#plots plot2
plot(data$datetime, data$Global_active_power, type="l", main="", xlab="", ylab="Global Active Power")


#plots plot3
#plots the axis
plot(data$datetime, data$Sub_metering_1, type="n", main="", xlab="", ylab="Energy sub metering")

#plots data - just "Sub_metering_1"
points(data$datetime, data$Sub_metering_1, type="l", col="black")

#plots data - just "Sub_metering_2"
points(data$datetime, data$Sub_metering_2, type="l", col="red")

#plots data - just "Sub_metering_3"
points(data$datetime, data$Sub_metering_3, type="l", col="blue")

#plots the legend
legend("topright", lty=1, bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))




#plots plot3
plot(data$datetime, data$Voltage, type="l", main="", xlab="datetime", ylab="Voltage")


#plots plot4
plot(data$datetime, data$Global_reactive_power, type="l", main="", xlab="datetime", ylab="Global_reactive_power")


#copy screen output to PNG file
dev.copy(png, file="plot4.png")

#To prevent the cropping the legend, I should have print directly on screen device PNG placing the following command before the plot function:
#png(file="plot3.png", width = 480, height = 480)
#
#This code sends to the screen to ease peer evaluation

#closes graphic device
dev.off()