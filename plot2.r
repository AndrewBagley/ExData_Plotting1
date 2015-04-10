## Exploratory Data Analysis
## Coursera
## John Hopkins University

## Project 1
## plot2.r

## Read in full Power_Power_data_subset_subsetset from working directory
Power_Power_data_subset_full <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                                         nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
Power_Power_data_subset_full$Date <- as.Date(Power_Power_data_subset_full$Date, format="%d/%m/%Y")

## Subset the data
Power_data_subset <- subset(Power_Power_data_subset_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(Power_Power_data_subset_full)

## Convert dates
datetime <- paste(as.Date(Power_data_subset$Date), Power_data_subset$Time)
Power_data_subset$Datetime <- as.POSIXct(datetime)

## Create Plot 2
plot(Power_data_subset$Global_active_power~Power_data_subset$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Save to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()