#Course Project 1 - Plot2 - Global Active Power vs Date (day)

#read file
mydata<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?")
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y") 

#subset data from the dates 2007-02-01 and 2007-02-02
mydata<-subset(mydata,Date>="2007-02-01"&Date<="2007-02-02",)

head(mydata)
#combine time
mydata$DateTime <- as.POSIXct(paste(mydata$Date,mydata$Time))

png(file = "plot2.png") #default is 480pixels by 480pixels
#plot graph
plot(mydata$Global_active_power~mydata$DateTime, xlab="",ylab="Global Active Power (kilowatts)",type="l")
#dev.copy(png,file="plot2.png")
dev.off()

