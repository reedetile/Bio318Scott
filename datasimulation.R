##################################
#Bio 381 tutorial: data sims     #
#16 Mar 2022                     #
##################################

library(boot)

#why simulate data?
#saves time: write partso fo code before you have data
#baseline for comparisons: check assumptions in your data
#test new stats techniques

#Part 1: Normally distributed data----------------------
#Start w/ groups of data
# for t-tests or ANOVA

#simulate groups w/ 20 obs

group1 <- rnorm(n=20,mean=2,sd=1)
hist(group1)
group2 <- rnorm(n=20,mean=5,sd=1)
group3 <- rnorm(n=20,mean=2,sd=3)
hist(group2)
hist(group3)

#simulate data for a linear regression
#two continuous r.v.'s
#start simple. assume intercept=0
#call slope beta1
# x is predictor variable
beta1 <- 1 #beta = slope
#our predictor var that is norm dist
x <- rnorm(n = 20)

#linear model:
y <- beta1*x
y==x

#you can play w/ diff slopes
beta1 <- 1.5
y <- beta1*x
y == x

#you can also add intercept
beta0 <- 2
y <- beta0 + beta1*x

#Part 2: abundance/count data-----------------
#Option 1: data are normalish
#use round() to remove decimals
abund1 <- round(rnorm(n=20,mean=50,sd=10))
hist(abund1)

#option 2: Poisson dist
abund2 <- rpois(20, lambda = 3)
barplot(table(abund2))

#sometimes the enviro effects counts
#to account for that, first create our lambdas
# then use lamdas to get counts

#use a regression to get initial values
pre.lambda <- beta0 + beta1*x
#use inverse log to make lambdas positive
lambda <- exp(pre.lambda)

#use lambda value created to get counts
abund3 <- rpois(n=20,lambda = lambda)
hist(table(abund3))

#Part 3: Occupancy, presence/absence data -------------
probs <- rbeta(n=20, shape=1,shape2 =1)
occ1 <- rbinom(n=20,size=1,prob=probs)
print(occ1)

#Option 2: occupancy w/ covariate
#similar to above, except we're generating probs, not lambdas

pre.probs <- beta0 + beta1*x
pre.probs

#convert to 0-1 scale
psi <- inv.logit(pre.probs)
#create new occupancy data
occ2 <- rbinom(n=20,size=1,prob=psi)
print(occ2)
