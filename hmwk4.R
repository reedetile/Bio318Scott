#Homework 4 for Bio 381
#Reed Scott
#2.9.2022

#1: Suppose x = 1.1, a = 2.2, and b = 3.3. Assign each expression to the value of the variable z and print the value stored in z.

x <- 1.1
a <- 2.2
b <- 3.3

#a: x^(a^b)
z <- x^(a^b)
z
#b: (x^a)^b
z <-(x^a)^b
z
#c: 3*(x^3)+2(x^2)+1
z <- 3*(x^3)+2*(x^2)+1
z

#Question 2: Using the rep and seq functions, create the following vectors

#a: (1,2,3,4,5,6,7,8,7,6,5,4,3,2,1)
a2 <- c(c(1:8),c(7:1))
a2

#b: (1,2,2,3,3,3,4,4,4,4,5,5,5,5,5)
b2 <- rep(seq(1:5), seq(1:5))
b2

#c: (5,4,4,3,3,3,2,2,2,2,1,1,1,1,1)

c2 <- rep(seq(from = 5, to = 1), times = seq(1:5))
c2

#Question 3: Not writing the whole thing out
q3 <- runif(2)
atanq3 <- atan(q3)
atanq3

#Question 4

queue <- c("sheep", "fox", "owl", "ant")

#a: the serpent arrives and gets in line
queue <- append(queue, 'serpent')
queue

#b: the sheep enters the ark
queue <- queue[-1]
queue

#c: the donkey arrives and talks his way to the front of the line
queue <- c('donkey', queue)
queue

#d: the serpent gets impatient and leaves
queue <- queue[-5]
queue
#E: e: the owl gets bored and leaves
queue <- queue[-3]
queue

#f: the aphid arrives and the ant invites him to cut in line.
queue <- append(queue, 'aphid', after = 2)
queue

#g: Finally, determine the position of the aphid in the line.#

which(queue == 'aphid')

#Question 5

q5 <- seq(1:100)

q5div2 <- q5[ q5 %% 2 == 0]

ans <- q5[ q5 %% 2 != 0 & q5 %% 3 != 0 & q5 %% 7 != 0]
ans
