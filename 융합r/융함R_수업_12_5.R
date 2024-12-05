## 1. gower 거리 계산----------------------------------------------------
library(cluster)

df   <- data.frame(
    age = c(20, 25, 30, 35, 40),
    gender = factor(c("M", "F", "M", "F", "M")),
    income = c(30, 40, 50, 60, 70)
)

gower_dist <- daisy(df, metric = "gower")
print(gower_dist)



## 2. k-means 군집화--------------------------------------------------------
str(iris)
newiris <- iris
newiris$Species <- NULL # 품종 정보 제거하여 답지를 지워본다. 

kc  <- kmeans(newiris, 3) # k는 3으로 지정
table(iris $Species, kc$cluster)
plot(newiris[c("Sepal.Length", "Sepal.Width")], col = kc$cluster)


