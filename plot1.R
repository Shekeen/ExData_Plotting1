tmpfile <- tempfile()
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              destfile=tmpfile,
              method="wget")
data <- read.csv(unz(tmpfile, "household_power_consumption.txt"),
                 header=T,
                 sep=";",
                 quote="",
                 na.strings="?",
                 colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
unlink(tmpfile)

hist(data$Global_active_power, 
     col="red", 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     breaks=15)
