
file <- "household_power_consumption.txt"
file_in <- read.table(file,header=TRUE,sep=";", colClasses= "character")
myset1 <- file_in[ file_in$Date == "2/1/2007", ]
myset2 <- file_in[ file_in$Date == "2/2/2007", ]
myset <- data.frame()
myset <- rbind(myset, myset1  )
myset <- rbind(myset, myset2 )

rm(file_in) 

png(file="plot1.png", bg="transparent", width=480, height=480)
hist( as.numeric(myset$Global_active_power) , main="Global Active Power",
      xlab="Global Active Power(killowatts)", col="red")
dev.off()

