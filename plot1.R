## plot1.R

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

## for testing, plot the graph to screen
if (printToScreen)
{
    hist(hpcFiltered$Global_active_power
       , xlab="Global Active Power (kilowatts)"
       , col="red"
      , main="Global Active Power")
}

## plot the graph to png file
png(filename="plot1.png",width = 480, height = 480)
hist(hpcFiltered$Global_active_power
     , xlab="Global Active Power (kilowatts)"
     , col="red"
     , main="Global Active Power")
dev.off()

## Restore graphical parameters
par(.pardefault)


