#Course Project 1 - Plot3 - Energy Sub Metering (for 3 types) vs Date (day)

#read file
mydata<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?")
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y") 

#subset data from the dates 2007-02-01 and 2007-02-02
mydata<-subset(mydata,Date>="2007-02-01"&Date<="2007-02-02",)

head(mydata)
#combine time
mydata$DateTime <- as.POSIXct(paste(mydata$Date,mydata$Time))


png(file = "plot3.png") #default is 480pixels by 480pixels

#plot graph
plot(mydata$Sub_metering_1~mydata$DateTime, xlab="",ylab="Energy sub metering",type="l")
lines(mydata$Sub_metering_2~mydata$DateTime, col="red")
lines(mydata$Sub_metering_3~mydata$DateTime, col="blue")
legend("topright",legend=grep("Sub_metering",names(mydata),value=T),col=c("black","red","blue"),lty=1, cex=0.75)
#dev.copy(png,file="plot3.png")
dev.off()

