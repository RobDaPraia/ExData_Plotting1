## plot4.R

## Exploratory Data Analysis, assignment 1
##
## Script to read data from "UC Irvine Machine Learning Repository" and to
## make a plot of the Global Active Powerfor the period 2007-02-01 / 2007-02-02



###########################################################################
## Required libraries
###########################################################################

#library(dplyr)

###########################################################################
## Load functions we have created in other source files
###########################################################################

source("DataLoader.R")

## Store graphical parameters to be able to restore these after plotting/changing parameters
## See: http://stackoverflow.com/questions/9292563/how-do-i-reset-the-graphical-parameters-back-to-default-values-without-use-of-de
.pardefault <- par(no.readonly = T)

## example setting limits, not used
#start <- as.Date("1/2/2007", "%d/%m/%Y") 
#end <- as.Date("3/2/2007", "%d/%m/%Y") 
#plot(hpcFiltered$DateTime, hpcFiltered$Global_active_power, pch=".", xlim=c(start, end)  )


## do plotting stuff with new settings

# for testing, plot the graph to screen
if (printToScreen)
{
    par(mfrow=c(2,2))

    ## Panel top left
    plot(hpcFiltered$DateTime, hpcFiltered$Global_active_power, type="l", xlab="",ylab="Global Active Power" )

    ## Panel top right
    plot(hpcFiltered$DateTime, hpcFiltered$Voltage, type="l", xlab="datetime",ylab="Voltage" )

    ## Panel bottom left
    plot(hpcFiltered$DateTime, hpcFiltered$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering" )
    lines(hpcFiltered$DateTime, hpcFiltered$Sub_metering_2, col="red")
    lines(hpcFiltered$DateTime, hpcFiltered$Sub_metering_3, col="blue")
    legend("topright", bty = "n", lty=c(1,1,1), col= c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

    ## Panel bottom right
    plot(hpcFiltered$DateTime, hpcFiltered$Global_reactive_power, type="l", xlab="datetime",ylab="Global_reactive_power" )
}

# plot the graph to png file
png(filename="plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))

## Panel top left
plot(hpcFiltered$DateTime, hpcFiltered$Global_active_power, type="l", xlab="",ylab="Global Active Power" )

## Panel top right
plot(hpcFiltered$DateTime, hpcFiltered$Voltage, type="l", xlab="datetime",ylab="Voltage" )

## Panel bottom left
plot(hpcFiltered$DateTime, hpcFiltered$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering" )
lines(hpcFiltered$DateTime, hpcFiltered$Sub_metering_2, col="red")
lines(hpcFiltered$DateTime, hpcFiltered$Sub_metering_3, col="blue")
legend("topright", bty = "n", lty=c(1,1,1), col= c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Panel bottom right
plot(hpcFiltered$DateTime, hpcFiltered$Global_reactive_power, type="l", xlab="datetime",ylab="Global_reactive_power" )
dev.off()

## Restore graphical parameters
par(.pardefault)

