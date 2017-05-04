plot1 <- function() {
    
    # Get data
    
    data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
    
    # Keep only wanted data
    
    data <- data[66637:69516,]
    data <- data[complete.cases(data),]
    
    # Convert the data
    
    data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
    
    # Create the PNG file
    
    png(filename = "plot1.png")
    
    # Create histogram
    
    hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
    
    # Close the PNG device
    
    dev.off()
    
}