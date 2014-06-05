## Read data
data <- read.csv2("household_power_consumption.txt", stringsAsFactors=FALSE)

## Filter
data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

## Calculate X axis
lfinal <- length(data$Global_active_power)
lmiddle <- lfinal/2

## Create plot
png(filename = "plot2.png", width = 480, height = 480)
plot(as.numeric(data$Global_active_power), xaxt="n", type = "n", xlab = "",
     ylab = "Global Active Power (kilowatts)")
axis(1, at = c(0, lmiddle, lfinal), labels = c("Thu", "Fri", "Sat"))
lines(as.numeric(data$Global_active_power))
dev.off()