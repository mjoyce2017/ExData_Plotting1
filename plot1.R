library("data.table")

# Load data
data1 <- data.table::fread("household_power_consumption.txt", na.strings="?")
# Transforming the dates from characters into R-recognized dates
data1[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
# Selecting the correct date range
data1 <- data1[(Date >= "2007-02-01") & (Date <= "2007-02-02")]
# Creating PNG with correct dimensions
png("plot1.png", width=480, height=480)
# Creating Plot1
plot1 <- hist(data1[,Global_active_power], main = "Global Active Power", 
             col="red", xlab = "Global Active Power (kilowatts)")

