## DataLoader.R

## function to read the data from disk, filter the data and create a new data frame "hpcFiltered"
## The data frame "hpcFiltered" can be used in all the separate plot assignments
## Even better would be to create a separate function instead of just including this R file.

############################################################################
## Constants 
## Use constants to prevent typos
############################################################################


datafolderUrl <- "./data/"

householdPowerConsumptionUrl <- paste0(datafolderUrl,"household_power_consumption.txt")
householdPowerConsumptionFilteredFilename <- "household_power_consumption_Filtered.txt"
householdPowerConsumptionFilteredUrl <- paste0(datafolderUrl,householdPowerConsumptionFilteredFilename)

###########################################################################
## Required libraries
###########################################################################

#library(dplyr)

###########################################################################
## Debug settings
###########################################################################

## When developing code it is easier and faster to work with a subset of the data sets 
## If useDataSubSet is TRUE then we use only 10 rows of the data sets
## If useDataSubSet is FALSE, we read the complete data sets
useDataSubSet <- TRUE
printToScreen <- TRUE

###########################################################################
## Load data from disk into a data frame
###########################################################################

## Check if a filtered subset of the household data already exists on disk
## if not we will create it from the complete data set, will be a lot slower
if (!householdPowerConsumptionFilteredFilename %in% list.files("./data/")) {
    print("filtered subset of the household data not found, loading the complete data set")
    
    if (useDataSubSet)
    {
        print("Warning: using sub sets of data for debugging!")
        subsetRows <- 20
    } else
    {
        subsetRows <- -1
    }
    
    ## Read the data from file
    ## Note: use the "na.strings="?" else a column with "?" value is converted into a character
    hpc <- read.table(householdPowerConsumptionUrl
                      , nrows=subsetRows
                      , sep= ';'
                      , header= TRUE
                      , stringsAsFactors=FALSE
                      , na.strings="?")  
    
    ## Create a Date column for filtering
    hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")
    #transform(x,datetime = as.POSIXct(paste(paste(Year,MM,DD,sep="-"), paste(HH,"00",sep=":"))))
    hpc$Date <- as.Date(hpc$Date,"%d/%m/%Y")
    
    #str(hpc)
    ## filter dataset on the requested period
    hpcFiltered <-  hpc[ hpc$Date >=  as.Date("1/2/2007","%d/%m/%Y")  
                         &  hpc$Date < as.Date("3/2/2007","%d/%m/%Y"),]
    
    
    # Write the filtered data frame to disk, so we can load it next time
    write.table(hpcFiltered,file=householdPowerConsumptionFilteredUrl, sep= ';', header= TRUE)
} else {
    ## load the filtered data set, loading will be a lot faster!
    hpcFiltered <-  read.table(householdPowerConsumptionFilteredUrl, header= TRUE, stringsAsFactors=FALSE, sep= ';')  
    hpcFiltered$DateTime <- strptime(hpcFiltered$DateTime,"%Y-%m-%d %H:%M:%S")
}

str(hpcFiltered)



