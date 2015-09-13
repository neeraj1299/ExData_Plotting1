
file <- "household_power_consumption.txt"
file_in <- read.table(file,header=TRUE,sep=";", stringsAsFactors=FALSE, dec=".")
myset <- file_in[file_in$Date %in% c("1/2/2007","2/2/2007") ,] 
rm(file_in)

y <- as.numeric(myset$Global_active_power)
x <- strptime(paste( myset$Date , myset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  

png(file="plot2.png", bg="transparent", width=480, height=480)
plot(x,y,  type="l",xlab="", ylab="Global Active Power(killowatts)")
dev.off()
