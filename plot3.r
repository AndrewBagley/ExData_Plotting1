## Exploratory Data Analysis
## Coursera
## John Hopkins University

## Project 1
## plot3.r

## Read in full data set from working directory
Power_data_full <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                            nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
Power_data_full$Date <- as.Date(Power_data_full$Date, format="%d/%m/%Y")

## Subset the data
Power_data_subset <- subset(Power_Power_data_subset_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(Power_Power_data_subset_full)

## Convert dates
datetime <- paste(as.Date(Power_data_subset$Date), Power_data_subset$Time)
Power_data_subset$Datetime <- as.POSIXct(datetime)

## Create Plot 3
with(Power_data_subset, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()