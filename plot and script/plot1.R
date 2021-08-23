power_con<-read.delim2("power.txt",header = TRUE,sep = ";")
power<-power_con[66638:69516,]
head(power)
tail(power)
library(dplyr)
power<-power %>% mutate(Date_time=paste(Date,Time,sep = " ")) %>% 
        select(-c(Date,Time))
power$Date_time<-dmy_hms(power$Date_time)

#plot
with(power,hist(as.numeric(Global_active_power),breaks=40,col="red",main = "Global active power",
                xlab = "Global active power(kilowatt)"))
dev.copy(png,file="plot.png")

