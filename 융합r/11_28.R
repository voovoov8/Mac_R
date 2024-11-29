
# 1. random forest ----
library(randomForest)
idx <- sample(seq_len(NROW(iris)), NROW(iris) * 0.7)
train <- iris[idx, ]
test <- iris[-idx, ]
model <- randomForest (Species ~ ., data = train, importance = T)
print (model)
predict(model, newdata = test [1:3, ])
print(test[1:3,"Species"])
importance(model)
varImpPlot(model)


# ----
library(e1071)

x <- matrix(rnorm(20 * 2), ncol = 2)
y <- c(rep(-1,10) , rep(1,10))

print(x)
print(y)

x[y == 1, ] <x[y==1, ] +1
plot(x, col = (3 - y))

dat <- data.frame(x = x, y = as.factor(y))
model <- svm(y ~., data = dat, kernal = "linear", cost = 10, scale = F)
plot(model, dat)


# svm ----
## 데이터 생성 ----
x <- matrix(rnorm(200 * 2), ncol = 2)
x[1:100, ] <- x[1:100, ] + 2 
x[101:150, ] <- x[101:150, ] - 2
y <- c(rep(1, 150), rep(2, 50))
plot(x, col = y)
dat <- data.frame(x = x, y = as.factor(y))

m <- svm(y ~ ., data = dat, kernel = "radial", cost = 1)
plot(m, dat[sample(200, 100), ])
