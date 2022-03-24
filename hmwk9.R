#Description-----------------------------------------
#Exercise 09
# 23 Mar 2022
#RCS

#Initialize -----------------------------------------
library(tidyverse)
library(ggplot2)
# set.seed(1234)

#library(TeachingDemos)
#char2seed('espress withdrawl')
#char2seed('espress withdrawl', set=FALSE)

# Load functions--------------------------------------
#######################################################
# FUNCTION: sim_df
# Purpuse:Make a simulation dataframe for BD salt tolerance
#input: sample size, mean and standard deviation for low salinity, mean and
        #standard deviation for high salinity, 
#output:dataframe of salainity level + bd load
#-----------------------------------------------------
sim_df <- function(sample = 50, mLow = 600, mHigh = 200, sdLow = 200, sdHigh = 50){
  salinity <- c(rep('low',sample),rep('high',sample))
  lowsal.load <- rnorm(n = sample, mean = mLow, sd = sdLow)
  highsal.load <- rnorm(n = sample, mean = mHigh, sd = sdHigh)
  bd.load <- append(lowsal.load,highsal.load)
  df1 <- data.frame(salinity,bd.load)
  bd.load
  head(df1)
  t.test(bd.load ~ salinity)
  return(df1)
}
  
#######################################################
# FUNCTION: simdfPois
# Purpuse: Make a simulation dataframe using a poisson distribution for data
#input: sample size, mean and standard deviation for low salinity, mean and
#standard deviation for high salinity, 
#output:dataframe of salainity level + bd load
#-----------------------------------------------------
simdfPois <- function(sample = 50, hLambda = 600, lLambda = 200){
  salinity <- c(rep('low',sample),rep('high',sample))
  lowsal.load <- rpois(n = sample, lambda = hLambda)
  highsal.load <- rpois(n = sample, lambda = lLambda)
  bd.load <- append(lowsal.load,highsal.load)
  poisDF <- data.frame(salinity,bd.load)
  bd.load
  head(poisDF)
  return(poisDF)
}

#######################################################
# FUNCTION: salinity_plot
# Purpuse: creat plot of bd vs. salinity
#input: dataframe used, salinity level, bd.load
#output: plot of salinity
#-----------------------------------------------------
salinity_plot <- function(df, salinity, bd.load) {
  salinityPlot <- ggplot(data = df, mapping = aes(x = salinity, y = bd.load, fill = salinity))
  salinityPlot +
    stat_summary(geom = 'bar', fun = 'mean')+
    scale_fill_manual(values = c(high ='grey30', low = 'gray70'),
                      labels = c('High', 'Low'))
}


# Global Variables-------------------------------------
#mock "Real" Data
sal <- c(rep('low',5),rep('high',5))
BDload.low <- rnorm(n = 5, mean = 600, sd = 200)
BDload.high <- rnorm(n = 5, mean = 200, sd = 50)
bd.load <- append(BDload.low, BDload.high)
RealDF <- data.frame(sal,bd.load)
# Program Body------------------------------------------

simDF <- sim_df() #using random values made in function
salinity_plot(df = simDF, salinity = simDF$salinity, bd.load = simDF$bd.load)

#running salinity_plot() using values made outside sim_df#
salinity_plot(df = RealDF, salinity = RealDF$sal, bd.load = RealDF$bd.load)

#Making a poisson distribution and graphing
simDF_pois <- simdfPois()
salinity_plot(simDF_pois, salinity = simDF_pois$salinity, bd.load = simDF_pois$bd.load)

#run using a for loop
for(i in 1:3){
  loopDF <- sim_df()
  p1 <- salinity_plot(df = loopDF, salinity = loopDF$salinity, bd.load = loopDF$bd.load)
  print(p1)
}
  
