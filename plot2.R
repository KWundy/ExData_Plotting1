Proj1<- read.csv("~/household_power_consumption.txt", sep=";",header = TRUE)
rbind(subset(x = Proj1, Proj1$Date=="1/2/2007"),subset(x = Proj1, Proj1$Date=="2/2/2007"))->Proj1.1

library(lubridate)

Proj1.1$Date<-dmy(Proj1.1$Date)

strptime(x = paste(Proj1.1$Date,Proj1.1$Time,sep = " "),format = "%Y-%m-%d %H:%M:%S")->DateTime
cbind(DateTime,Proj1.1[,-c(1:2)])->Proj1.2

as.numeric(as.character(Proj1.2$Global_active_power))->Proj1.2$Global_active_power

png(filename = "plot2.png")
plot(x = Proj1.2$DateTime,y = Proj1.2$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)" )
dev.off()
