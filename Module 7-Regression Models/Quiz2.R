# Q1
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
fit <- lm(y~x)
summary(fit)
# 0.05296

# Q2
# 0.223

# Q3
library(UsingR)
data(mtcars)
x <- mtcars$wt
y <- mtcars$mpg
fit <- lm(y~x)
predict(fit, data.frame(x=mean(x)), interval = "confidence" )
#  fit      lwr      upr
#1 20.09062 18.99098 21.19027

# Q4
help(mtcars)
#[, 6]  wt	Weight (lb/1000)

# Q5
predict(fit, data.frame(x=mean(3)), interval = "prediction")
#  fit      lwr      upr
#1 21.25171 14.92987 27.57355

# Q6
fit2 <- lm(y ~ I(x / 2))
sumCoef <- summary(fit2)$coefficients #refer to Lecture 01_07, page 7

# sumCoef
# Estimate Std. Error   t value     Pr(>|t|)
# (Intercept)  37.28513   1.877627 19.857575 8.241799e-19
# I(x/2)      -10.68894   1.118202 -9.559044 1.293959e-10

sumCoef[2,1]+c(-1,1)*qt(.975,df=fit2$df)*sumCoef[2,2]
# -12.97262  -8.40527

# Q7
summary(fit)$coefficients[2, 1] #-5.344472
fit3 <- lm(y ~ I(x / 100))
summary(fit3)$coefficients[2, 1]#-534.4472

# Q8. 
# Y = beta0 + beta1 * X + epsilon
#   = beta0 + beta1 * (X + c) 
#   = beta0 - c*beta1 + c*beta1 + X*beta1 
# New intercept: beta0 - c*beta1

## Q9
# ∑ni=1(Yi−Y^i)2 

fitRes <- fit$residuals ^ 2
fitIntercept <- lm(mpg ~ 1, mtcars)
fitInterceptRes <- fitIntercept$residuals ^ 2
sum(fitRes) /sum(fitInterceptRes) 
# 0.2471672

# Problem 10.
sum(resid(fit))
# If an intercept is included, then they will sum to 0.

