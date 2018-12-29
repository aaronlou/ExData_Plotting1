#####################################
# plot 4
#####################################
# read data
d <- read.table("~/Downloads/household_power_consumption.txt",header=TRUE,sep = ";")
d2 <- subset(d,as.Date(Date,format="%d/%m/%Y") >= as.Date("1/2/2007",format="%d/%m/%Y") & as.Date(Date,format="%d/%m/%Y") <= as.Date("2/2/2007",format="%d/%m/%Y"))

# change the data type
d2$Global_active_power <- as.double(d2$Global_active_power)
d2$Global_reactive_power <- as.double(d2$Global_reactive_power)
d2$Voltage <- as.double(d2$Voltage)
d2$Sub_metering_1 <- as.double(d2$Sub_metering_1)
d2$Sub_metering_2 <- as.double(d2$Sub_metering_2)
d2$Sub_metering_3 <- as.double(d2$Sub_metering_3)

png("/Users/lousiyuan/dataScience/gitHub/ExData_Plotting1/plot4.png")
par(mfrow=c(2,2))
plot(d2$Global_active_power,xaxt="n",type="l",ylab="Global Active Power",xlab="datetime")
axis(side = 1, at = c(0,1440),labels = c("Tue","Wed"))

plot(d2$Voltage,xaxt="n",type="l",ylab="Voltage",xlab = "datetime")
axis(side = 1, at = c(0,1440),labels = c("Tue","Wed"))

y1 <- as.vector( d2$Sub_metering_1)
y2 <- as.vector( d2$Sub_metering_2)
y3 <- as.vector( d2$Sub_metering_3)
plot(y1, xaxt="n",type = "l",ylab="Energy sub metering",xlab = "datetime")
lines(y2, xaxt="n",type = "l",ylab="Energy sub metering",xlab = "datetime",col="red")
lines(y3, xaxt="n",type = "l",ylab="Energy sub metering",xlab = "datetime",col="blue")
axis(side = 1, at = c(0,1440),labels = c("Tue","Wed"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty=1 ,cex=0.39)


plot(d2$Global_reactive_power,xaxt="n",type="l",ylab="Global_reactive_power",xlab="datetime")
axis(side = 1, at = c(0,1440),labels = c("Tue","Wed"))

dev.off()


