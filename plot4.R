## Read data
data <- read.csv2("household_power_consumption.txt", stringsAsFactors=FALSE)

## Filter
data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

## Calculate X axis
lfinal <- length(data$Sub_metering_1)
lmiddle <- lfinal/2

## Create plots
png(filename = "plot4.png", width = 480, height = 480)
par(mfcol =c(2,2))

plot(as.numeric(data$Global_active_power), xaxt="n", type = "n", xlab = "",
     ylab = "Global Active Power")
axis(1, at = c(0, lmiddle, lfinal), labels = c("Thu", "Fri", "Sat"))
lines(as.numeric(data$Global_active_power))

plot(as.numeric(data$Sub_metering_1), xaxt="n", type = "n", xlab = "",
     ylab = "Energy sub metering")
axis(1, at = c(0, lmiddle, lfinal), labels = c("Thu", "Fri", "Sat"))
lines(as.numeric(data$Sub_metering_1), col="black")
lines(as.numeric(data$Sub_metering_2), col="red")
lines(as.numeric(data$Sub_metering_3), col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

plot(as.numeric(data$Voltage), xaxt="n", type = "n", xlab = "datetime",
     ylab = "Voltage")
axis(1, at = c(0, lmiddle, lfinal), labels = c("Thu", "Fri", "Sat"))
lines(as.numeric(data$Voltage))

plot(as.numeric(data$Global_reactive_power), xaxt="n", type = "n", xlab = "datetime",
     ylab = "Global_reactive_power")
axis(1, at = c(0, lmiddle, lfinal), labels = c("Thu", "Fri", "Sat"))
lines(as.numeric(data$Global_reactive_power))

dev.off()