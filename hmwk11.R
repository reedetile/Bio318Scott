#Description-----------------------------------------
#Exercise 11: Batch processing
#batch processing real files. My choosen files are some data sets from my masters
#  06 Apr 2022
#RCS

#Initialize -----------------------------------------
library(tidyverse)
# set.seed(1234)

#library(TeachingDemos)
#char2seed('espress withdrawl')
#char2seed('espress withdrawl', set=FALSE)

# Load functions--------------------------------------

# Global Variables-------------------------------------
path.root <- 'D:/OneDrive - University of Vermont/Classes/Spring2022/CompBio/Lab/Bio381Scott'
path.data <- paste(path.root,'/hmwk11Data',sep='')
setwd(path.root)
file_names <- list.files(path=path.data)
head(file_names)
# Program Body------------------------------------------  
#for loop to read in CSV files)
setwd(path.data)
list <- list()
for(i in 1:length(file_names)){
  file.name <- file_names[i]
  list[[i]] <- read.csv(file = file.name)
}
names(list) <- c('Exp3','Exp1','Exp2')
list2env(list,.GlobalEnv)

#Create function to read
names.list <- list()
for(i in 1:length(file_names)){
  names.list[[i]] <- names(list[[i]])
}
names.list[2]
