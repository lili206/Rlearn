#效应量（Effect Size）是统计学中用来量化现象强度或变量间关联大小的指标，
#它不依赖样本量，能回答“差异有多大”或“关系有多强”的问题。
#####################################################################
#准备数据
# 设置随机种子，保证结果可重复
set.seed(2026)

# 实验组
group1 <- rnorm(50, mean = 78, sd = 10)

# 对照组
group2 <- rnorm(50, mean = 72, sd = 12)

# 合并为数据框
score <- c(group1, group2)
group <- factor(rep(c("Experimental", "Control"), each = 50))

data <- data.frame(score, group)

#Cohen’s d
#d 值	效应大小
#0.2	小效应
#0.5	中等效应
#0.8	大效应
# 手动计算
#------------------------------
# m1 <- mean(group1)
# m2 <- mean(group2)
# sd1 <- sd(group1)
# sd2 <- sd(group2)
# n1 <- length(group1)
# n2 <- length(group2)

# # 合并标准差
# s_pooled <- sqrt(
#   ((n1 - 1) * sd1^2 + (n2 - 1) * sd2^2) /
#   (n1 + n2 - 2)
# )

# # Cohen's d
# cohen_d <- (m1 - m2) / s_pooled
# print(cohen_d)
#--------------------------------

#Hedges’ g
#小样本偏差校正 SUM<50时
# Hedges' g 校正因子
#--------------------------------
# correction <- 1 - (3 / (4 * (n1 + n2) - 9))

# hedges_g <- cohen_d * correction
# print(hedges_g)
#--------------------------------

#使用包
library(effsize)
cohen_result <- cohen.d(
  score ~ group,
  data = data,
  pooled = TRUE,      # 使用合并标准差
  paired = FALSE     # 独立样本，若为前后测同一批人则设 TRUE
)

print(cohen_result)
#effsize 中 cohen.d 默认输出的是 Hedges’ g（已校正）
print(levels(data$group))

# 输出
# Cohen's d

# d estimate: -0.7167925 (medium)
# 95 percent confidence interval:
#      lower      upper 
# -1.1262327 -0.3073523 

# [1] "Control"      "Experimental"

# 指标值含义
# Cohen's d（Hedges' g）	-0.72	中等效应，实验组更高
# 95% CI	[-1.13, -0.31]	不含 0，效应显著
# 方向	实验组 > 对照组	均值差约 6 分
# 效应评级	medium	0.5 < |d| < 0.8

#实验组平均成绩显著高于对照组，效应量为中等
#（d = -0.72，95% CI [-1.13, -0.31]），该差异既有统计学意义，也有实际意义。