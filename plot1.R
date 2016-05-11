library(dplyr)
library(data.table)
original<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?",stringsAsFactors = F)
subset_data <-filter(original,Date %in% c("1/2/2007","2/2/2007"))
subset_data$dateTime<-with(subset_data,
                           strptime(paste(Date, Time,sep=" "),format="%d/%m/%Y %H:%M:%S"))

png("Rplot1.png")
hist(as.numeric(subset_data$Global_active_power),
     col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power")
dev.off()

