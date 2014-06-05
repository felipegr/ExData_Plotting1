## Read data
data <- read.csv2("household_power_consumption.txt", stringsAsFactors=FALSE)

## Filter
data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

## Calculate X axis
lfinal <- length(data$Sub_metering_1)
lmiddle <- lfinal/2

## Create plot
png(filename = "plot3.png", width = 480, height = 480)
plot(as.numeric(data$Sub_metering_1), xaxt="n", type = "n", xlab = "",
     ylab = "Energy sub metering")
axis(1, at = c(0, lmiddle, lfinal), labels = c("Thu", "Fri", "Sat"))
lines(as.numeric(data$Sub_metering_1), col="black")
lines(as.numeric(data$Sub_metering_2), col="red")
lines(as.numeric(data$Sub_metering_3), col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()