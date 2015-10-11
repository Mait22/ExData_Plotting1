#Making the plot number 1
#Loading data from working directory
#Assumes that household_power_consumption.txt data file is stored in R working directory


wd <- getwd()
file_path <- paste(wd,"household_power_consumption.txt",sep = "/")
household_power_consumption <- read.csv(file_path, sep=";")


#Subseting the data to include only dates of 2007-02-01 and 2007-02-02
household_power_consumption$Date <- as.Date(household_power_consumption$Date,"%d/%m/%Y")
household_power_consumption <- household_power_consumption[household_power_consumption$Date == "2007-02-01" | household_power_consumption$Date == "2007-02-02",]


#Converting variable "Global_active_power" into numeric form
household_power_consumption$Global_active_power <- as.character(household_power_consumption$Global_active_power)
household_power_consumption$Global_active_power <- as.numeric(household_power_consumption$Global_active_power)


#Making the plot itself
par(mfrow = c(1,1))
par(mar=c(4,4,2,2))
hist(household_power_consumption$Global_active_power,
     xlab = "Global Active Power (kilowats)", 
     ylab = "Frequency", 
     col = "red", 
     breaks = 16, 
     freq = TRUE,
     main = "Global Active Power",
     cex.lab=0.8)

#Coping plot to png file from screen device "Windows" or "Guartz"
dev.copy(png,'plot1.png')
dev.off()

