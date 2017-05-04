plot4 <- function() {
    
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
    data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
    data$Voltage <- as.numeric(as.character(data$Voltage))
    data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
    
    # Open PNG device
    
    png(filename = "plot4.png")
    
    # Split plots
    
    par(mfrow = c(2, 2), mar = c(5.1, 4.1, 1, 2.1))
    
    # Plot 1
    
    plot(data$Date, data$Global_active_power, type = "l", col = "black", ylab = "Global Active Power (kilowatts)", xlab = "")
    
    # Plot 2
    
    plot(data$Date, data$Voltage, type = "l", col = "black", ylab = "Voltage", xlab = "datatime")
    
    # Plot 3
    
    plot(data$Date, data$Sub_metering_1, ylab = "Energy sub metering", xlab = "", col = "black", type = "l", ylim = range(c(0,40)))
    par(new = TRUE)
    plot(data$Date, data$Sub_metering_2, col = "red", type = "l",ylim = range(c(0,40)), ylab = "", xlab = "")
    par(new = TRUE)
    plot(data$Date, data$Sub_metering_3, col = "blue", type = "l",ylim = range(c(0,40)), ylab = "", xlab = "")
    legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black","red","blue"), cex = .7)
    
    # Plot 4
    
    plot(data$Date, data$Global_reactive_power, type = "l", col = "black", ylab = "Global_reactive_power", xlab = "datatime")
    
    # Close PNG device
    
    dev.off()
    
}