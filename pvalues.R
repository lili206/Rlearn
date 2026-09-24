#P值是统计学中用来衡量证据强度的一个指标，
#用于帮助判断一个研究结果是否“ statistically significant（统计显著）”。
#某种新药是否能显著降低血糖？
# H₀（原假设）：药物无效，血糖均值变化 = 0
# H₁（备择假设）：药物有效，血糖均值变化 ≠ 0
# 假设我们测量了 10 名患者用药前后的血糖变化（用药后 − 用药前）
# 血糖变化值（负值表示下降）
glucose_change <- c(-3, -1, -4, 0, -2, -5, -3, -2, -1, -4)

#---------------------------
#计算 t 统计量
# x_bar <- mean(glucose_change)
# s <- sd(glucose_change)
# n <- length(glucose_change)
# mu0 <- 0

# t_stat <- (x_bar - mu0) / (s / sqrt(n))
# print(t_stat)
# # 双侧检验
# p_value <- 2 * pt(abs(t_stat), df = n - 1, lower.tail = FALSE)
# print(p_value)
#--------------------------
#函数计算
t_test_result <- t.test(glucose_change, mu = 0)
print(t_test_result)