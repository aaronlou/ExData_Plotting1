#####################################
# plot 3
#####################################
# read data
d <- read.table("~/Downloads/household_power_consumption.txt",header=TRUE,sep = ";")
d2 <- subset(d,as.Date(Date,format="%d/%m/%Y") >= as.Date("1/2/2007",format="%d/%m/%Y") & as.Date(Date,format="%d/%m/%Y") <= as.Date("2/2/2007",format="%d/%m/%Y"))

# change the data type
d2$Sub_metering_1 <- as.double(d2$Sub_metering_1)
d2$Sub_metering_2 <- as.double(d2$Sub_metering_2)

png("/Users/lousiyuan/dataScience/gitHub/ExData_Plotting1/plot3.png")
y1 <- as.vector( sorted_d2$Sub_metering_1)
y2 <- as.vector( sorted_d2$Sub_metering_2)
y3 <- as.vector( sorted_d2$Sub_metering_3)
plot(y1, xaxt="n",type = "l",ylab="Energy sub metering",xlab = "Weekdays")
lines(y2, xaxt="n",type = "l",ylab="Energy sub metering",xlab = "Weekdays",col="red")
lines(y3, xaxt="n",type = "l",ylab="Energy sub metering",xlab = "Weekdays",col="blue")

axis(side = 1, at = c(0,1440),labels = c("Tue","Wed"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty=1 )
dev.off()

