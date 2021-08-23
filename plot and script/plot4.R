power_con<-read.delim2("power.txt",header = TRUE,sep = ";")
power<-power_con[66638:69516,]
head(power)
tail(power)
library(dplyr)
power$Global_reactive_power<-as.numeric(power$Global_reactive_power)
power$Voltage<-as.numeric(power$Voltage)
power$Global_intensity<-as.numeric(power$Global_intensity)
power$Sub_metering_1<-as.numeric(power$Sub_metering_1)
power$Sub_metering_2<-as.numeric(power$Sub_metering_2)
power$Sub_metering_3<-as.numeric(power$Sub_metering_3)

power<-power %>% mutate(Date_time=paste(Date,Time,sep = " ")) %>% 
        select(-c(Date,Time))
power$Date_time<-dmy_hms(power$Date_time)

#plots
par(mfrow=c(2,2),mar=c(4,4,2,2))
with(power,{
        plot(Date_time,Global_active_power,type="n",
             xlab = "datetime",ylab = "Global active power")
        lines(Date_time,Global_active_power,type="l",lwd=1)
})
with(power,{
        plot(Date_time,Voltage,type="n",
             xlab = "datetime",ylab = "voltage")
        lines(Date_time,Voltage,type="l",lwd=1)
})

with(power,{
        plot(Date_time,Global_active_power,type="n",
             xlab = "datetime",ylab = "Energy Sub metering",ylim=c(0,50))
        lines(Date_time,Sub_metering_1,type="l")
        lines(Date_time,Sub_metering_2,type="l",col="red")
        lines(Date_time,Sub_metering_3,type="l",col="blue")
        legend("topright",pch = "_",col = c("black","red","blue"),
               legend = c("sub_metering_1","sub_metering_2","sub_metering_3"))
})

with(power,{
        plot(Date_time,Global_reactive_power,type="n",
             xlab = "datetime",ylab = "Global reactive power")
        lines(Date_time,Global_reactive_power,type="l",lwd=1)
})
