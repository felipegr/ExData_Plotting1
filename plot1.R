## Read data
data <- read.csv2("household_power_consumption.txt", stringsAsFactors=FALSE)

## Filter
data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

## Create plot
png(filename = "plot1.png", width = 480, height = 480)
hist(as.numeric(data$Global_active_power), xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power", col = "red")
dev.off()