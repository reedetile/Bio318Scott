# Homework 7
# RCS
#03/02/22

library(tidyverse)
data(iris)
dim(iris)

###Question 2: Create a new data frame iris1 that contains only the species virginica and versicolor with sepal lengths longer than 6 cm and sepal widths longer than 2.5 cm. How many observations and variables are in the dataset?###

iris1 <- iris %>%
  filter(Species == 'virginica' | Species == 'versicolor') %>%
  filter(Sepal.Length > 6 & Sepal.Width > 2.5)

###Question 3: Now, create a iris2 data frame from iris1 that contains only the columns for Species, Sepal.Length, and Sepal.Width. How many observations and variables are in the dataset?###

iris2 <- iris1 %>%
  select(Species, Sepal.Length, Sepal.Width)

#### Question 4: Create an iris3 data frame from iris2 that orders the observations from largest to smallest sepal length. Show the first 6 rows of this dataset.###

iris3 <- iris2 %>%
  arrange(by = desc(Sepal.Length))

### Question 5: Create an iris4 data frame from iris3 that creates a column with a sepal area (length * width) value for each observation. How many observations and variables are in the dataset?###

iris4 <- iris3 %>%
  mutate(sepal.area = Sepal.Length*Sepal.Width)

### Question 6: Create iris5 that calculates the average sepal length, the average sepal width, and the sample size of the entire iris4 data frame and print iris5.###

iris5 <- iris4 %>%
  summarize(meanLength = mean(Sepal.Length), meanWidth = mean(Sepal.Width), totalN = n())
iris5

###Question 7: Finally, create iris6 that calculates the average sepal length, the average sepal width, and the sample size for each species of in the iris4 data frame and print iris6.###

iris6 <- iris4 %>%
  group_by(Species) %>%
  summarize(meanLength = mean(Sepal.Length), meanWidth = mean(Sepal.Width), totalN = n())
iris6

#### Question 8: In these exercises, you have successively modified different versions of the data frame iris1 iris1 iris3 iris4 iris5 iris6. At each stage, the output data frame from one operation serves as the input fro the next. A more efficient way to do this is to use the pipe operator %>% from the tidyr package. See if you can rework all of your previous statements into an extended piping operation that uses iris as the input and generates iris6 as the output.###

iris6 <- iris %>%
  filter(Species == 'virginica' | Species == 'versicolor') %>%
  filter(Sepal.Length > 6 & Sepal.Width > 2.5) %>%
  select(Species, Sepal.Length, Sepal.Width) %>%
  arrange(by = desc(Sepal.Length)) %>%
  mutate(sepal.area = Sepal.Length*Sepal.Width) %>%
  group_by(Species) %>%
  summarize(meanLength = mean(Sepal.Length), meanWidth = mean(Sepal.Width), totalN = n())
  
# Question 9: Create a ‘longer’ data frame with three columns named: Species, Measure, Value.
wideIris <- iris %>%
  pivot_longer(cols = Sepal.Length:Sepal.Width, names_to = 'Measure', values_to = 'Values', values_drop_na = TRUE) %>%
  select('Species','Measure','Values')
wideIris
  
