# Quiz 1 Answers

# Q1
values <- c(0.18, -1.54, 0.42, 0.95)
weights <- c(2,1,3,1)

#answer can be found via 2 methods below
mu <- sum(values * weights) / sum(weights)
mu1 <- weighted.mean(values, weights)
# 0.1471

# Q2
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
lm(y ~ x - 1) # or use formula = y ~ 0 + x, to force line through origin
#Coefficients: x=0.8263  

# Q3
library(UsingR)
data(mtcars)
head(mtcars)

fit <- lm(mpg~wt, data = mtcars)
coef(fit)
# (Intercept)          wt 
# 37.285126   -5.344472 

# Q4
corOfYandX <- 0.5
sdYoverX <- 2
beta1 <- corOfYandX*sdYoverX
# cor(x,y) = 0.5, means slope is 0.5 * 2 = 1

# Q5
corOfYandX <- 0.4
quiz1 <- 1.5
quiz2 <- quiz1*corOfYandX * 1 + 0
# 0.6

# Q6
x <- c(8.58, 10.46, 9.01, 9.64, 8.86)
mean <- mean(x)
sd <- sd(x)
z1 <- ( x[1] - mean ) / sd
# -0.9718658

# Q7
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
lm(y~x)
# x = -1.713, intercept = 1.567

# Q8
# 0

# Q9
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
mean(x)
# 0.573

# Q10
# cor(X, Y)*sd(Y)/sd(X) / (cor(X,Y)*sd(X)/sd(Y)) 
# = sd(Y)^2/(sd(X)^2)
# = var(Y)/var(X)