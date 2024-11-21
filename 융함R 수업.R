install.packages("mlbench")
library(mlbench)
data("BostonHousing")

model <- lm(medv~., BostonHousing)
car::vif(model)

# r^2 가 얼마 이상일 떄
