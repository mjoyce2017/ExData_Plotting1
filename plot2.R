library("data.table")

# Load data
data2 <- data.table::fread("household_power_consumption.txt", na.strings="?")
# Transforming the dates from characters into R-recognized dates & times
data2[, DateTime := as.POSIXct(paste(Date,Time), 
                               format = ("%d/%m/%Y %H:%M:%S"))]
# Selecting the correct date range
data2 <- data2[(DateTime >= "2007-02-01") & (DateTime < "2007-02-03")]

# Creating PNG with correct dimensions
png("plot2.png", width=480, height=480)

# Creating Plot2
plot(x = data2[, DateTime], y = data2[, Global_active_power], 
     ylab = "Global Active Power (kilowatts)", xlab="", type="l")
