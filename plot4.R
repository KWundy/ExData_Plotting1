Proj1<- read.csv("~/household_power_consumption.txt", sep=";",header = TRUE)
rbind(subset(x = Proj1, Proj1$Date=="1/2/2007"),subset(x = Proj1, Proj1$Date=="2/2/2007"))->Proj1.1

library(lubridate)

Proj1.1$Date<-dmy(Proj1.1$Date)

strptime(x = paste(Proj1.1$Date,Proj1.1$Time,sep = " "),format = "%Y-%m-%d %H:%M:%S")->DateTime
cbind(DateTime,Proj1.1[,-c(1:2)])->Proj1.2

as.numeric(as.character(Proj1.2$Global_active_power))->Proj1.2$Global_active_power
as.numeric(as.character(Proj1.2$Voltage))->Proj1.2$Voltage
as.numeric(as.character(Proj1.2$Sub_metering_1))->Proj1.2$Sub_metering_1
as.numeric(as.character(Proj1.2$Sub_metering_2))->Proj1.2$Sub_metering_2
as.numeric(as.character(Proj1.2$Sub_metering_3))->Proj1.2$Sub_metering_3
as.numeric(as.character(Proj1.2$Global_reactive_power))->Proj1.2$Global_reactive_power


png(filename = "plot4.png")
par(mfrow=c(2,2))
plot(x = Proj1.2$DateTime,y = Proj1.2$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power")
plot(x = Proj1.2$DateTime,y = Proj1.2$Voltage,xlab = "datetime",ylab = "Voltage",type = "l")
plot(x = Proj1.2$DateTime,y = Proj1.2$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
lines.default(x = Proj1.2$DateTime,y = Proj1.2$Sub_metering_2,col="red")
lines.default(x = Proj1.2$DateTime,y = Proj1.2$Sub_metering_3,col="blue")
legend("topright",border = "white",bty = "n",lwd = 1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(x = Proj1.2$DateTime,y = Proj1.2$Global_reactive_power,type = "l",ylab = "Global_reactive_power",xlab = "datetime")
dev.off()