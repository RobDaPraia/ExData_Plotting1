## dataCheck.R

## Use this script to test loading the data and to get a feeling for the data set

hpcraw <- read.csv("./data/household_power_consumption.txt", stringsAsFactors=FALSE, sep= ';',header=FALSE)
head(hpcraw,10)
tail(hpcraw,10)


hpc <- read.table("./data/household_power_consumption.txt", sep= ';',header= TRUE)   
str(hpc)
summary(hpc)
nrow(hpc)


