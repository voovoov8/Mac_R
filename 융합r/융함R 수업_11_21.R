
# package -----------------------------------------------------------------
install.packages("mlbench")
install.packages("waveslim")  # 패키지 설치
install.packages("leaps")
install.packages("MASS")
install.packages("rpart.plot")
install.packages("party")

library(mlbench)
library(waveslim)
library(leaps)
library(MASS)
library(model)

# 1번 실습 -------------------------------------------------------------------
data("BostonHousing")

model <- lm(medv~., BostonHousing)
car::vif(model)




# 2번 실습 -------------------------------------------------------------------
library(car)

head(cars)
(m <- lm(dist ~ speed, data = cars))
coef(m) 
fitted(m)
residuals(m)
predict(m, newdata = data.frame(speed = 5)) # speed 가 5 값을 예측해본다 (사실상 대입이다)
summary(m)
plot(cars$speed, residuals(m))
plot(m, which = 2)
dwt(m)


full <- lm(dist ~ speed, data=cars)
reduced <- lm(dist ~ 1, data = cars)
anova(reduced, full)





# 실습 3========================================================================
m <- lm(medv ~ ., data = BostonHousing)
step(m, direction = "both")
step(m, direction = "backward")
step(m, direction = "forward")


mal <- regsubsets(medv ~ ., data = BostonHousing)
summary(mal)
summary(mal)$bic
summary(mal)$adjr2


# 실습4 ==============================================================================
data("Boston")

poly_model <- lm(medv ~ poly(lstat,2), data = Boston)
summary(poly_model)

plot(Boston$lstat, Boston$medv, xlab = "LSTAT", ylab = "MEDV", pch = 19, col= "blue") #nolint
points(Boston$lstat, fitted(poly_model), col = "red", pch = 20)
lines(sort(Boston$lstat), fitted(poly_model)[order(Boston$lstat)],col = "red", lwd = 2)

# 실습5 ==============================================================================
library(rpart)
library(rpart.plot)

model <- report(Species ~., data = iris)
prp(model, type = 4, extra =1)

predict(model, newdata = iris[101,, drop = F])



library(party)
model <- ctree(Species~., data = iris)
plot(model)
