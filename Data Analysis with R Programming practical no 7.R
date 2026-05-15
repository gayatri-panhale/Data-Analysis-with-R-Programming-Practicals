# ASSIGNMENT 7
# CORRELATION AND HYPOTHESIS TESTING

# IMPORT DATA
sales_data <- read.csv("sales_data.csv")

# =========================
# Q1 CORRELATION ANALYSIS
# =========================

# a) Pearson Correlation
cor(sales_data$Income, sales_data$SpendingScore)

# b) Correlation Test
cor.test(sales_data$Income,
         sales_data$SpendingScore)

# c) Scatter Plot
plot(sales_data$Income,
     sales_data$SpendingScore)

# d) Spearman Correlation
cor(sales_data$Income,
    sales_data$SpendingScore,
    method="spearman")

# e) Kendall Correlation
cor(sales_data$Income,
    sales_data$SpendingScore,
    method="kendall")

# =========================
# Q2 NORMAL DISTRIBUTION
# =========================

# a) Generate normal distribution
x <- rnorm(100, mean=50, sd=10)

# b) Histogram
hist(x)

# c) Density Plot
plot(density(x))

# d) Mean
mean(x)

# e) Standard Deviation
sd(x)

# =========================
# Q3 T-TEST
# =========================

# a) One sample t-test
t.test(sales_data$Income,
       mu=50000)

# b) Two sample t-test
t.test(Income ~ Gender,
       data=sales_data)

# c) Mean income
mean(sales_data$Income)

# d) Mean by gender
aggregate(Income ~ Gender,
          sales_data,
          mean)

# e) Boxplot
boxplot(Income ~ Gender,
        data=sales_data)

# =========================
# Q4 CHI-SQUARE TEST
# =========================

# a) Frequency table
table(sales_data$Gender,
      sales_data$Purchase)

# b) Chi-square test
chisq.test(table(
  sales_data$Gender,
  sales_data$Purchase))

# c) Region vs Purchase
table(sales_data$Region,
      sales_data$Purchase)

# d) Chi-square test
chisq.test(table(
  sales_data$Region,
  sales_data$Purchase))

# e) Bar Plot
barplot(table(sales_data$Purchase))

# =========================
# Q5 BINOMIAL TEST
# =========================

# a) Binomial Test
binom.test(
  sum(sales_data$Purchase=="Yes"),
  nrow(sales_data),
  p=0.5)

# b) Purchase Frequency
table(sales_data$Purchase)

# c) Probability Distribution
rbinom(50,10,0.5)

# d) Poisson Distribution
rpois(50,5)

# e) Wilcoxon Test
wilcox.test(
  sales_data$Income,
  sales_data$Age)