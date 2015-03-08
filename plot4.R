#Course Project 1 - Plot4 - 
#Total 4 graphs : 
#- Global Active Power vs Date (day)
#- Voltage vs Date (day)
#- Plot 3 : Energy sub metering vs Date (day)
#- Global Reactive Power vs Date (day)


#read file
mydata<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?")
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y") 

#subset data from the dates 2007-02-01 and 2007-02-02
mydata<-subset(mydata,Date>="2007-02-01"&Date<="2007-02-02",)

head(mydata)
#combine time
mydata$DateTime <- as.POSIXct(paste(mydata$Date,mydata$Time))

png(file = "plot4.png") #default is 480pixels by 480pixels
par(mfrow=c(2,2))
#plot graph 1
plot(mydata$Global_active_power~mydata$DateTime,xlab="",ylab="Global Active Power",type="l")

#plot graph 2
plot(mydata$Voltage~mydata$DateTime,xlab="datetime",ylab="Voltage",type="l")

#plot graph 3
plot(mydata$Sub_metering_1~mydata$DateTime, xlab="",ylab="Energy sub metering",type="l")
lines(mydata$Sub_metering_2~mydata$DateTime, col="red")
lines(mydata$Sub_metering_3~mydata$DateTime, col="blue")
legend("topright",legend=grep("Sub_metering",names(mydata),value=T),col=c("black","red","blue"),lty=1,lwd=1,bty="n",x.intersp=0.5)

#this one works if using dev.copy instead of png
#max_y<-max(max(mydata$Sub_metering_1),max(mydata$Sub_metering_2),max(mydata$Sub_metering_3))
#mean_x<-mean(mydata$DateTime)
#legend(mean_x,max_y+5,legend=grep("Sub_metering",names(mydata),value=T),col=c("black","red","blue"),lty=1,lwd=1,bty="n",cex=0.5,y.intersp=0.2,x.intersp=0.5)

#plot graph 4
plot(mydata$Global_reactive_power~mydata$DateTime, xlab="datetime",ylab="Global_reactive_power",type="l")


#dev.copy(png,file="plot4.png")
dev.off()

