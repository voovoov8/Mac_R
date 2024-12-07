View(CPS1988)
str(CPS1988)
# AER 패키지 로드
library(AER)

# CPS1988 데이터셋 불러오기
data("CPS1988")

# 데이터셋의 첫 몇 행 확인
head(CPS1988)
# ... 기존 코드 ...
# wage와 education 컬럼의 NA 값 확인
sum(is.na(CPS1988$wage))  # wage 컬럼의 NA 개수
sum(is.na(CPS1988$education))  # education 컬럼의 NA 개수
# ... 기존 코드 ...

# ... 기존 코드 ...
# wage와 education 컬럼에서 로그를 취할 수 없는 값 확인
sum(CPS1988$wage <= 0)  # wage 컬럼에서 로그를 취할 수 없는 값의 개수
sum(CPS1988$education <= 0)  # education 컬럼에서 로그를 취할 수 없는 값의 개수
# ... 기존 코드 ...

View(CPS1988)

CPS1988$parttime <- ifelse(CPS1988$parttime == "yes", 1, 0)

