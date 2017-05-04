plot3 <- function() {
    
    # Get data
    
    data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
    
    # Keep only wanted data
    
    data <- data[66637:69516,]
    data <- data[complete.cases(data),]
    
    # Convert data
    
    data$Date <- paste(data$Date, data$Time)
    data$Date <- strptime(data$Date, format = "%d/%m/%Y %H:%M:%S")
    data <- data[-2]
    data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
    data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
    data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
    
    # Open PNG device
    
    png(filename = "plot3.png")
    
    # Create the plot
    
    plot(data$Date, data$Sub_metering_1, ylab = "Energy sub metering", xlab = "", col = "black", type = "l", ylim = range(c(0,40)))
    
    par(new = TRUE)
    plot(data$Date, data$Sub_metering_2, col = "red", type = "l",ylim = range(c(0,40)), ylab = "", xlab = "")
    par(new = TRUE)
    plot(data$Date, data$Sub_metering_3, col = "blue", type = "l",ylim = range(c(0,40)), ylab = "", xlab = "")
    legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black","red","blue"))
    
    # Close PNG device
    
    dev.off()
    
}