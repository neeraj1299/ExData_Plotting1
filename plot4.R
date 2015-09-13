
file <- "household_power_consumption.txt"
file_in <- read.table(file,header=TRUE,sep=";", stringsAsFactors=FALSE, dec=".")
myset <- file_in[file_in$Date %in% c("1/2/2007","2/2/2007") ,] 
rm(file_in)

x <- strptime(paste( myset$Date , myset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  

png(file="plot4.png", bg="transparent", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,2))
plot(x,as.numeric(myset$Global_active_power),  type="l",xlab="", ylab="Global Active Power")
plot(x,as.numeric(myset$Voltage), type="l",xlab="datetime", ylab="Voltage")
{
    plot(x,as.numeric(myset$Sub_metering_1), type="l",xlab="", ylab="Energy sub metering")
    lines(x,as.numeric(myset$Sub_metering_2), type="l" , col="red")
    lines(x,as.numeric(myset$Sub_metering_3), type="l",  col="blue")
    legend("topright", lty=1, col=c("black","red", "blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
}
plot(x,as.numeric(myset$Global_reactive_power), type="l",xlab="datetime", ylab="Global_reactive_power")

dev.off()
