library("data.table")

# Load data
data4 <- data.table::fread("household_power_consumption.txt", na.strings="?")

# Transforming the dates from characters into R-recognized dates & times
data4[, DateTime := as.POSIXct(paste(Date,Time), 
                               format = ("%d/%m/%Y %H:%M:%S"))]

# Selecting the correct date range
data4 <- data4[(DateTime >= "2007-02-01") & (DateTime < "2007-02-03")]

# Creating PNG with correct dimensions
png("plot4.png", width=480, height=480)

# Creating the panel parameters
par(mfrow=c(2,2))

# Creating Plot 1
plot(data4[, DateTime], data4[, Global_active_power], type="l", xlab="", ylab="Global Active Power")

# Crating Plot 2
plot(data4[, DateTime],data4[, Voltage], type="l", xlab="datetime", ylab="Voltage")

# Creating Plot 3
plot(data4[,DateTime], data4[, Sub_metering_1], type="l", xlab="", 
     ylab="Energy sub metering")

# Adding the other Sub meters
lines(data4[,DateTime], data3[, Sub_metering_2], col = "red")
lines(data4[,DateTime], data3[, Sub_metering_3], col = "blue")

# Adding legend
legend("topright", col=c("black","red","blue"), lty=c(1,1), lwd=c(1,1), 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Creating Plot 4
plot(data4[, DateTime], data4[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")
