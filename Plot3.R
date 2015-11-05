

powerdata <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      , check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")

## filter the data by using the subset function
filteredpowerdata <- subset(powerdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## Converting date columns
datetime <- paste(as.Date(filteredpowerdata$Date), filteredpowerdata$Time)
filteredpowerdata$Datetime <- as.POSIXct(datetime)


with(filteredpowerdata, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))




## Saving to png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()