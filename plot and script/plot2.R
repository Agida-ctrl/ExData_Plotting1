power_con<-read.delim2("power.txt",header = TRUE,sep = ";")
power<-power_con[66638:69516,]
head(power)
tail(power)
library(dplyr)
power<-power %>% mutate(Date_time=paste(Date,Time,sep = " ")) %>% 
        select(-c(Date,Time))
power$Date_time<-dmy_hms(power$Date_time)

#plot
with(power,{
        plot(Date_time,Global_active_power,type="n",
             xlab = "datetime",ylab = "Global active power")
        lines(Date_time,Global_active_power,type="l",lwd=1)
})
        