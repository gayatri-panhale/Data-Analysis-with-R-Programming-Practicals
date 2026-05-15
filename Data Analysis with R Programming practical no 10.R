# ASSIGNMENT 10
# FINAL PROJECT USING R

# INSTALL PACKAGE
install.packages("ggplot2")

# LOAD LIBRARY
library(ggplot2)

# IMPORT DATA
sales_data <- read.csv("sales_data.csv")

# =========================
# Q1 VIEW DATA
# =========================

# a) Display first 10 rows
head(sales_data,10)

# b) Display last 10 rows
tail(sales_data,10)

# c) Structure of dataset
str(sales_data)

# d) Summary statistics
summary(sales_data)

# e) Column names
names(sales_data)

# =========================
# Q2 DATA ANALYSIS
# =========================

# a) Total Revenue
sum(sales_data$Revenue)

# b) Average Revenue
mean(sales_data$Revenue)

# c) Maximum Revenue
max(sales_data$Revenue)

# d) Minimum Revenue
min(sales_data$Revenue)

# e) Revenue by City
aggregate(
  Revenue ~ City,
  sales_data,
  sum
)

# =========================
# Q3 DATA VISUALIZATION
# =========================

# a) Bar Chart
ggplot(sales_data,
       aes(x=City)) +
  geom_bar()

# b) Scatter Plot
ggplot(sales_data,
       aes(x=Price,y=Revenue)) +
  geom_point()

# c) Histogram
ggplot(sales_data,
       aes(x=Revenue)) +
  geom_histogram()

# d) Boxplot
ggplot(sales_data,
       aes(x=Category,y=Revenue)) +
  geom_boxplot()

# e) Line Chart
ggplot(sales_data,
       aes(x=OrderID,y=Revenue)) +
  geom_line()

# =========================
# Q4 FILTERING AND SORTING
# =========================

# a) Revenue greater than 50000
subset(
  sales_data,
  Revenue > 50000
)

# b) Female customers
subset(
  sales_data,
  Gender=="Female"
)

# c) Sort by Revenue
sales_data[
  order(sales_data$Revenue),
]

# d) Sort by Price
sales_data[
  order(sales_data$Price),
]

# e) Top 10 rows
head(sales_data,10)

# =========================
# Q5 STATISTICAL ANALYSIS
# =========================

# a) Correlation
cor(
  sales_data$Income,
  sales_data$SpendingScore
)

# b) Correlation Test
cor.test(
  sales_data$Income,
  sales_data$SpendingScore
)

# c) One sample t-test
t.test(
  sales_data$Income,
  mu=50000
)

# d) Chi-square test
chisq.test(
  table(
    sales_data$Gender,
    sales_data$Purchase
  )
)

# e) Binomial test
binom.test(
  sum(sales_data$Purchase=="Yes"),
  nrow(sales_data),
  p=0.5
)