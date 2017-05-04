plot2 <- function() {
    
    # Get data
    
    data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
    
    # Keep only wanted data
    
    data <- data[66637:69516,]
    data <- data[complete.cases(data),]
    
    # Convert data
    
    data$Date <- paste(data$Date, data$Time)
    data$Date <- strptime(data$Date, format = "%d/%m/%Y %H:%M:%S")
    data <- data[-2]
    data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
    
    # Open PNG device
    
    png(filename = "plot2.png")
    
    # Create plot
    
    plot(data$Date, data$Global_active_power, type = "l", col = "black", ylab = "Global Active Power (kilowatts)", xlab = "")
    
    # Close PNG device
    
    dev.off()
    
}