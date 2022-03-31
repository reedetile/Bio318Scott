


#Create counter function#
count <- function(x){
  counter <- 0
  for(i in 1:length(x)){
    if(x[i] == 0){
      counter <- counter+1
    }
    else{
      counter <- counter+0
    }
  }
  return(counter)
}

#Create dummy data + run function
rv1 <- rep(0,20)
count(rv1)
#created a vector of 20 zeros, counter returns 20 zeros
rv2 <- c(rep(0,10),rep(1,10))
rv2 <- rv2[which(rv2 == 0)]        

count2 <- function(x){
  return(length(x[which(x == 0)]))
}
count2(rv2)


#Question 3: Write a function that takes as input two integers representing the number of rows and columns in a matrix. The output is a matrix of these dimensions in which each element is the product of the row number x the column number.#

make_matrix <- function(a=4,b=5){
  m <- matrix(nrow = a, ncol = b)
  for(i in 1:nrow(m)){
    for(j in 1:ncol(m)){
      m[i,j] <- i*j
    }
  }
  return(m)
}
make_matrix()

#Question 4:

groupA <- cbind(rep('groupA',100),rnorm(n = 100, mean = 60, sd = 5))
groupB <- cbind(rep('groupB',100),rnorm(n = 100, mean = 45, sd = 5))
groupC <- cbind(rep('groupC',100),rnorm(n = 100, mean = 81, sd = 5))
df1 <- rbind(groupA,groupB,groupC)
df1
colnames(df1) <- c('group','variable')
df1 <- as.data.frame(df1)
df1$variable <- as.numeric(df1$variable)

# Write a custom function that 1) reshuffles the response variable, and 2) calculates the mean of each group
#in the reshuffled data. Store the means in a vector of length 3.
library(dplyr)
shuffle <- function(df = df1){
  colnames(df) <- c('group','variable')
  variable <- (sample(df$variable, replace = F))
  group <- df$group
  df2 <- data.frame(group,variable)
  df3 <- df2 %>% group_by(group) %>% summarize(mean = mean(variable))
  return(df3)
}
shuffle(df1)

#Use a for loop to repeat the function in b 100 times. Store the results in a data frame that has 1 column indicating the replicate number and 1 column for each new group mean, for a total of 4 columns.
library(tidyverse)
results <- data.frame()
for(i in 1:100){
  df3 <- shuffle(df1)
  df3 <- df3 %>% pivot_wider(names_from = group, values_from = mean)
  #rownames_to_column(df3)
  df3 <-cbind(i,df3)
  results <- rbind(results, df3)
}
results  

#Use qplot() to create a histogram of the means for each reshuffled group. Or, if you want a challenge, use ggplot() to overlay all 3 histograms in the same figure. How do the distributions of reshuffled means compare to the original means?
library(ggplot2)
xlabel <- c('GroupA','GroupB','GroupC')
loop.vector <- 2:4
for( i in loop.vector){
  plot <- qplot(results[,i], geom='histogram',xlab = xlabel[i-1])
  print(plot)
}
