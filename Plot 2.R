#Coursera Data Science Exporatory Data
#Course project Plot 2
#Gary Clarke


##load data
rm(list = ls())
data <- read.table("household_power_consumption.txt", header = TRUE,
                   sep = ";", na.strings = "?")


# convert date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
head(data)


#subset data

data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007/02/02"))


#convert dates and times 
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

#plot 2 

data$datetime <- as.POSIXct(data$datetime)
attach(data)
plot(Global_active_power ~ datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
#save the file
dev.copy(png, file = "Plot2.png", height = 480, width = 480)
dev.off()
detach(data)