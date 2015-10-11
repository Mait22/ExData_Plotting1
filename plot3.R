#Making the plot number 4
#Loading data from working directory
#Assumes that household_power_consumption.txt data file is stored in R working directory


wd <- getwd()
file_path <- paste(wd,"household_power_consumption.txt",sep = "/")
household_power_consumption <- read.csv(file_path, sep=";")


#Subseting the data to include only dates of 2007-02-01 and 2007-02-02
household_power_consumption$Date <- as.Date(household_power_consumption$Date,"%d/%m/%Y")
household_power_consumption <- household_power_consumption[household_power_consumption$Date == "2007-02-01" | household_power_consumption$Date == "2007-02-02",]

#Adding Date_time column
household_power_consumption$D_time <- paste(household_power_consumption[,1],household_power_consumption[,2],sep = " ")

#Converting D_time column to ISOdatetime class
household_power_consumption$D_time <- as.POSIXct(household_power_consumption$D_time)

#Converting variables Sub_metering 1 to 3 and Global_active_power into numeric form
household_power_consumption$Global_active_power <- as.character(household_power_consumption$Global_active_power)
household_power_consumption$Global_active_power <- as.numeric(household_power_consumption$Global_active_power)
household_power_consumption$Sub_metering_1 <- as.character(household_power_consumption$Sub_metering_1)
household_power_consumption$Sub_metering_1 <- as.numeric(household_power_consumption$Sub_metering_1)
household_power_consumption$Sub_metering_2 <- as.character(household_power_consumption$Sub_metering_2)
household_power_consumption$Sub_metering_2 <- as.numeric(household_power_consumption$Sub_metering_2)
household_power_consumption$Sub_metering_3 <- as.character(household_power_consumption$Sub_metering_3)
household_power_consumption$Sub_metering_3 <- as.numeric(household_power_consumption$Sub_metering_3)

#Making the plot itself
par(mfrow = c(1,1))
par(mar=c(4,4,2,2))
plot(household_power_consumption$D_time,household_power_consumption$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering", yaxt="n",cex.lab=0.8)
axis(2, at=c(0,10,20,30), labels=c(0,10,20,30)) 
lines(household_power_consumption$D_time,household_power_consumption$Sub_metering_2, col= "red")
lines(household_power_consumption$D_time,household_power_consumption$Sub_metering_3, col = "blue")
par(mar=c(0, 0, 0, 0))
legend("topright",c("Sub_metering_1  ","Sub_metering_2  ","Sub_metering_3  "),lty = c(1,1,1),lwd = c(1,1,1), col=c("black","red","blue"),cex = 0.8,xjust=0.5)



#Coping plot to png file from screen device "Windows" or "Guartz"
dev.copy(png,'plot3.png')
dev.off()