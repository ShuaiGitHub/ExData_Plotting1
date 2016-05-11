library(dplyr)
library(data.table)
original<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?",stringsAsFactors = F)
subset_data <-filter(original,Date %in% c("1/2/2007","2/2/2007"))
subset_data$dateTime<-with(subset_data,
                           strptime(paste(Date, Time,sep=" "),
                           format="%d/%m/%Y %H:%M:%S")
                          )
png("RPlot3.png")
with(subset_data,plot(dateTime,Sub_metering_1,type="l",col="black",
                      xlab="",
                      ylab="Energy sub metering",
                      main=""))
with(subset_data,lines(dateTime,Sub_metering_2,col="red"))
with(subset_data,lines(dateTime,Sub_metering_3,col="blue"))
legend("topright",
       lty=1,lwd=2,
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","sub_metering_3")
       )
dev.off()
