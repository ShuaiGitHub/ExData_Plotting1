library(dplyr)
library(data.table)
original<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?",stringsAsFactors = F)
subset_data <-filter(original,Date %in% c("1/2/2007","2/2/2007"))
subset_data$dateTime<-with(subset_data,
                           strptime(paste(Date, Time,sep=" "),
                                    format="%d/%m/%Y %H:%M:%S")
)
png("RPlot4.png",480,480)
par(mfrow=c(2,2))
with(subset_data,{
  hist(as.numeric(Global_active_power),
       col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power")
  plot(dateTime,
       as.numeric(Voltage),
       type="l",xlab="datetime",ylab="Voltage")
  {plot(dateTime,Sub_metering_1,type="l",col="black",
                        xlab="",
                        ylab="Energy sub metering",
                        main="")
  lines(dateTime,Sub_metering_2,type="l",col="red")
  lines(dateTime,Sub_metering_3,type="l",col="blue")
  legend("topright",
         lty=1,lwd=2,
         col=c("black","red","blue"),
         legend=c("Sub_metering_1","Sub_metering_2","sub_metering_3")
  )}
  plot(dateTime,
       as.numeric(Global_reactive_power),
       type="l",xlab="datetime",ylab="Global_reactive_power")
})
dev.off()