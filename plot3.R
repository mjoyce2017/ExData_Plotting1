library("data.table")

# Load data
data3 <- data.table::fread("household_power_consumption.txt", na.strings="?")

# Transforming the dates from characters into R-recognized dates & times
data3[, DateTime := as.POSIXct(paste(Date,Time), 
                               format = ("%d/%m/%Y %H:%M:%S"))]

# Selecting the correct date range
data3 <- data3[(DateTime >= "2007-02-01") & (DateTime < "2007-02-03")]

# Creating PNG with correct dimensions
png("plot3.png", width=480, height=480)

# Creating Plot3
plot(data3[,DateTime], data3[, Sub_metering_1], type="l", xlab="", 
     ylab="Energy sub metering")

# Adding the other Sub meters
lines(data3[,DateTime], data3[, Sub_metering_2], col = "red")
lines(data3[,DateTime], data3[, Sub_metering_3], col = "blue")

# Adding legend
legend("topright", col=c("black","red","blue"), lty=c(1,1), lwd=c(1,1), 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))