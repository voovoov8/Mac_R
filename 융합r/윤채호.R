# 덴드로그램 그려보기 
# kmeans 를 해보는 것

# 데이터 불러오기 ------------------------------------------------------
library(readr)
util <- read_csv("utilities.csv")
str(util)


# 1. 덴드로그램 그리기 -----------------------------------------------------
## 1-1. 거리 행렬 계산 (유클리드 거리 사용) -----------------------------------
dist_matrix <- dist(util)

## 1-2. 계층적 클러스터링 수행 -----------------------------------------------
hc <- hclust(dist_matrix)
str(hc) 
## 1-3. 덴드로그램 그리기 -------------------------------------------------
plot(hc, main = "Utilities 데이터의 덴드로그램", xlab = "", sub = "", cex = 0.9)
## 1-4. 덴드로그램에서 세 개의 클러스터 시각화 ----------------------------------
plot(hc)
rect.hclust(hc, k = 3, border = 2:4)  # 3개의 클러스터를 색상으로 구분



# 2. 군집화 수행 -------------------------------------------------------------
# 필요한 패키지 로드
library(ggplot2)
library(dplyr)
library(cluster)

# 필요한 열 선택 (매출액과 연료비)
util$company <- NULL 
data_points <- util %>% select(sales, fuel_cost)

# K-평균 군집화 수행
set.seed(42)
kmeans_result <- kmeans(data_points, centers = 3)

# 클러스터 결과를 데이터에 추가
util$cluster <- as.factor(kmeans_result$cluster)

# 군집화 결과 시각화
ggplot(util, aes(x = sales, y = fuel_cost, color = cluster)) +
  geom_point(size = 3, alpha = 0.7) +
  labs(title = "Clustered Scatter Plot of Sales vs Fuel Cost",
       x = "Sales (매출액)",
       y = "Fuel Cost (연료비)") +
  theme_minimal()
