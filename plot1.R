#Course Project 1 - Plot1 - Freq vs Global Active Power

#read file
mydata<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?")
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y") 

#subset data from the dates 2007-02-01 and 2007-02-02
mydata<-subset(mydata,Date>="2007-02-01"&Date<="2007-02-02",)

png(file = "plot1.png") #default is 480pixels by 480pixels
#plot graph
hist(mydata$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
#dev.copy(png,file="plot1.png")
dev.off()



