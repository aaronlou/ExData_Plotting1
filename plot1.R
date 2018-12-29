# read data
d <- read.table("~/Downloads/household_power_consumption.txt",header=TRUE,sep = ";")
d2 <- subset(d,as.character(Date) >= "1/2/2007" & as.character(Date) <= "2/2/2007")
# change the data type and units
d2$Global_active_power <- as.numeric(d2$Global_active_power)/1000
# plot 
hist(d2$Global_active_power,xlab = "Global Active Power(kilowatts)",main="Global Active Power",col = "red")

