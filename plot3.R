## plot3.R

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

# for testing, plot the graph to screen
if (printToScreen)
{
    plot(hpcFiltered$DateTime, hpcFiltered$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering" )
    lines(hpcFiltered$DateTime, hpcFiltered$Sub_metering_2, col="red")
    lines(hpcFiltered$DateTime, hpcFiltered$Sub_metering_3, col="blue")

    ## interesing post about legend line types
    ## http://stackoverflow.com/questions/19053440/r-legend-with-points-and-lines-being-different-colors-for-the-same-legend-item
    legend("topright", lty=c(1,1,1), col= c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
}

# plot the graph to png file
png(filename="plot3.png",width = 480, height = 480)
plot(hpcFiltered$DateTime, hpcFiltered$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering" )
lines(hpcFiltered$DateTime, hpcFiltered$Sub_metering_2, col="red")
lines(hpcFiltered$DateTime, hpcFiltered$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1,1), col= c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

## Restore graphical parameters
par(.pardefault)


