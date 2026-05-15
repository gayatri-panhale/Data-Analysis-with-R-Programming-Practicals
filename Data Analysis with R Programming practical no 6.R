# ASSIGNMENT 6
# AGGREGATION AND FREQUENCY TABLES

# IMPORT DATA
sales_data <- read.csv("sales_data.csv")

# =========================
# Q1 SALES PERFORMANCE
# =========================

# a) Total sales by region
aggregate(Revenue ~ Region,
          sales_data,
          sum)

# b) Average sales by gender
aggregate(Revenue ~ Gender,
          sales_data,
          mean)

# c) Purchase frequency
table(sales_data$Purchase)

# d) Region vs Purchase
table(sales_data$Region,
      sales_data$Purchase)

# e) Chi-square test
chisq.test(
  table(
    sales_data$Region,
    sales_data$Purchase
  )
)

# =========================
# Q2 CUSTOMER SEGMENTATION
# =========================

# a) Count customers by region
table(sales_data$Region)

# b) Average purchase by region
tapply(
  sales_data$Revenue,
  sales_data$Region,
  mean
)

# c) Gender frequency
table(sales_data$Gender)

# d) Gender vs Region
table(
  sales_data$Gender,
  sales_data$Region
)

# e) Chi-square test
chisq.test(
  table(
    sales_data$Gender,
    sales_data$Region
  )
)

# =========================
# Q3 PURCHASE PATTERN
# =========================

# a) Total purchase amount
sum(sales_data$Revenue)

# b) Row sum example
m <- matrix(1:9,nrow=3)

apply(m,1,sum)

# c) Purchase frequency
table(sales_data$Purchase)

# d) Purchase vs Region
table(
  sales_data$Purchase,
  sales_data$Region
)

# e) Chi-square test
chisq.test(
  table(
    sales_data$Purchase,
    sales_data$Region
  )
)

# =========================
# Q4 HIGH VALUE CUSTOMER
# =========================

# Create high value dataset
high_value <- subset(
  sales_data,
  Revenue > 5000
)

# a) Display customers
head(high_value)

# b) Mean purchase
mean(high_value$Revenue)

# c) Region frequency
table(high_value$Region)

# d) Gender vs Purchase
table(
  high_value$Gender,
  high_value$Purchase
)

# e) Chi-square test
chisq.test(
  table(
    high_value$Gender,
    high_value$Purchase
  )
)

# =========================
# Q5 BUSINESS ANALYSIS
# =========================

# a) Total revenue
sum(sales_data$Revenue)

# b) Average revenue by region
aggregate(
  Revenue ~ Region,
  sales_data,
  mean
)

# c) Region frequency
table(sales_data$Region)

# d) Region vs Purchase
table(
  sales_data$Region,
  sales_data$Purchase
)

# e) Statistical inference
chisq.test(
  table(
    sales_data$Region,
    sales_data$Purchase
  )
)