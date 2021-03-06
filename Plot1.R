


powerdata <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      , check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")

## filter the data by using the subset function
filteredpowerdata <- subset(powerdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## Converting date columns
datetime <- paste(as.Date(filteredpowerdata$Date), filteredpowerdata$Time)
filteredpowerdata$Datetime <- as.POSIXct(datetime)

## Plot the historgram
hist(filteredpowerdata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


