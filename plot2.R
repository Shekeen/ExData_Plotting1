#tmpfile <- tempfile()
#download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
#              destfile=tmpfile,
#              method="wget")
#data <- read.csv(unz(tmpfile, "household_power_consumption.txt"),
#                 header=T,
#                 sep=";",
#                 quote="",
#                 na.strings="?",
#                 colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
#unlink(tmpfile)

data <- read.table("data/household_power_consumption.txt",
                   header=TRUE,
                   sep=";",
                   quote="",
                   na.strings="?",
                   colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
data_sample <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
data_sample$DateTime <- strptime(paste(data_sample$Date, data_sample$Time),
                                 format="%d/%m/%Y %H:%M:%S")

Sys.setlocale(category="LC_ALL", locale="en_US.UTF-8")

plot(data_sample$DateTime, data_sample$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

dev.copy(png, "plot2.png", width=500, height=500)
dev.off()
