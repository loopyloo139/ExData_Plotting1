#Coursera Data Science Exporatory Data
#Course project Plot 1
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
data$datetime <- strptime(paste(data$Time), "%Y-%m-%d %H:%M:%S")

#plot 1 


attach(data)
hist(Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "Red")

#save the file
dev.copy(png, file = "Plot1.png", height = 480, width = 480)
dev.off()
detach(data)






