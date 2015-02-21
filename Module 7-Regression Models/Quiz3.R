#Quiz 3 Answers

#Q1
data(mtcars)
attach(mtcars)
fit <- lm(mpg ~ as.factor(cyl) + wt , data = mtcars)
summary(fit)

#Ans
#Coefficients:
#                 Estimate  Std. Error t value Pr(>|t|)    
#(Intercept)       33.9908     1.8878  18.006  < 2e-16 ***
# as.factor(cyl)6  -4.2556     1.3861  -3.070 0.004718 ** 
# as.factor(cyl)8  -6.0709     1.6523  -3.674 0.000999 ***
# wt               -3.2056     0.7539  -4.252 0.000213 ***

#Q2
fit2 <- lm(mpg ~ as.factor(cyl), data = mtcars)
summary(fit2)

#Ans
#Coefficients:
#                 Estimate   Std. Error t value Pr(>|t|)    
#  (Intercept)      26.6636     0.9718  27.437  < 2e-16 ***
#  as.factor(cyl)6  -6.9208     1.5583  -4.441 0.000119 ***
#  as.factor(cyl)8 -11.5636     1.2986  -8.905 8.57e-10 ***

# Holding weight constant, cylinder appears to have less of an
# impact on mpg than if weight is disregarded.

#Q3
#interaction between number of cylinders (as a factor variable) and weight
fit3 <- lm(mpg ~ as.factor(cyl)*wt, data=mtcars) 
summary(fit3)

likelihood <- anova(fit, fit3, test="Chi")

#Analysis of Variance Table

#Model 1: mpg ~ as.factor(cyl) + wt
#Model 2: mpg ~ as.factor(cyl) * wt
#Res.Df    RSS Df Sum of Sq Pr(>Chi)
#1     28 183.06                      
#2     26 155.89  2     27.17   0.1038

likelihood$Pr  #0.1037502

#Ans - The P-value is larger than 0.05. So, according to our criterion, 
#we would fail to reject, which suggests that the interaction terms may not be necessary.

#Q4
fit4 <- lm(mpg ~ I(wt * 0.5) + factor(cyl), data = mtcars)
summary(fit4)

#Ans
#Coefficients:
#                 Estimate Std. Error t value Pr(>|t|)    
#(Intercept)      33.991      1.888  18.006  < 2e-16 ***
#  I(wt * 0.5)    -6.411      1.508  -4.252 0.000213 ***
#  factor(cyl)6   -4.256      1.386  -3.070 0.004718 ** 
#  factor(cyl)8   -6.071      1.652  -3.674 0.000999 ***

# wt coef: The estimated expected change in MPG per one ton increase in 
# weight for a specific number of cylinders (4, 6, 8).

#Q5
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
fit5 <- lm (y~x)
hatvalues(fit5)

#Ans 
#1         2         3         4         5 
#0.2286650 0.2438146 0.2525027 0.2804443 0.9945734

#Q6
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
fit6 <- lm (y~x)
dfbetas(fit6)

#Ans -133.82261293

#Q7 See lecture #2
