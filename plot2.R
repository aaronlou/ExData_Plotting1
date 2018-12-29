#####################################
# plot 2
#####################################
# read data
d <- read.table("~/Downloads/household_power_consumption.txt",header=TRUE,sep = ";")
d2 <- subset(d,as.Date(Date,format="%d/%m/%Y") >= as.Date("1/2/2007",format="%d/%m/%Y") & as.Date(Date,format="%d/%m/%Y") <= as.Date("2/2/2007",format="%d/%m/%Y"))

# change the data type and units
d2$Global_active_power <- as.numeric(d2$Global_active_power)


# convert datetime to weekday 
d2$wd <- as.factor(weekdays(as.Date(d2$Date)))
#sort
attach(d2)
sorted_d2 <- d2[order(Date,Time),]

png("/Users/lousiyuan/dataScience/gitHub/ExData_Plotting1/plot2.png")
x <- c(0,length(d2$wd))
y <- as.vector( sorted_d2$Global_active_power)
plot(y, xaxt="n",type = "l",ylab="Global Active Power(kilowatts)",xlab = "Weekdays")
axis(side = 1, at = c(0,1440),labels = c("Tue","Wed"))
dev.off()

