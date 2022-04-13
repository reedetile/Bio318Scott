#Description-----------------------------------------
#Hmwk 12: Practice with ggplot
#  13 Apr 2022
#RCS

#Initialize -----------------------------------------
library(tidyverse)
library(ggplot2)
library(ggthemes)
library(patchwork)
# set.seed(1234)

#library(TeachingDemos)
#char2seed('espress withdrawl')
#char2seed('espress withdrawl', set=FALSE)

# Load functions--------------------------------------


# Global Variables-------------------------------------
path.root <- 'D:/OneDrive - University of Vermont/Classes/Spring2022/CompBio/Lab/Bio381Scott'
path.data <- paste(path.root,'/hmwk11Data',sep='')
path.graphs <-paste(path.root,'/graphs',sep='')
setwd(path.root)
file_names <- list.files(path=path.data)
head(file_names)
#for loop to read in CSV files)
setwd(path.data)
list <- list()
for(i in 1:length(file_names)){
  file.name <- file_names[i]
  list[[i]] <- read.csv(file = file.name)
}
names(list) <- c('Exp3','Exp1','Exp2')
list2env(list,.GlobalEnv)
# Program Body------------------------------------------


#making simple plots w/ exp1#
exp1Plot <- ggplot(data = Exp1,aes(x = as.factor(Density), y = Rafts, fill = as.factor(Density)))
simpPlot <- exp1Plot +
  geom_bar(stat = 'summary')+
  theme_classic()+
  ggtitle('Simple Plot')
#modify font + font size
modFont<- exp1Plot+
  geom_bar(stat = 'summary')+
  theme_classic(base_size = 20, base_family = 'serif')+
  ggtitle('Modify Font Sizes')
#change axis labels
changAxis <- exp1Plot+
  geom_bar(stat = 'summary')+
  labs(x = 'larval density', y = 'Average egg rafts')+
  theme_classic(base_size = 20, base_family = 'serif')+
  ggtitle('Change Axis Titles')
#custom colour pallete
custCol <- exp1Plot+
  geom_bar(stat = 'summary')+
  labs(x = 'larval density', y = 'Average egg rafts')+
  theme_classic(base_size = 20, base_family = 'serif')+
  scale_fill_manual(values = c('gray71', 'grey30','grey30','grey30'))+
  ggtitle('Custom Colour Pallete')

#Okay. We've had some fun with colors, not lets use facet
#to start, I'm gonna try to make up some data on a variable we'll call temperature
temp <- rnorm(n=200,mean=37,sd=3) #creat fake temp variable
exp1.2 <- cbind(Exp1,temp) #adding temp variable to our df

#okay so now lets try to plot
exp1.2Plot <- ggplot(exp1.2,aes(x=temp, y=Rafts))
facetPlot<-exp1.2Plot+
  geom_line()+
  facet_grid(as.factor(Density)~.,scales='free')+
  ggtitle('Facet Plots')
  
#now save all the plots!
setwd(path.graphs)
savePlots <- list(simpPlot,modFont,changAxis,custCol,facetPlot)
names(savePlots) <- c('simpPlot','modFont','changAxis','custCol','facetPlot')
for(i in 1:length(savePlots)){
  ggsave(filename = paste(names(savePlots[i]),sep = '','.png'),plot = savePlots[[i]], device = 'png')
}

