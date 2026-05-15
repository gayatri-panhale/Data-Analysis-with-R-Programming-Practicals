# ASSIGNMENT 5

# INSTALL PACKAGE
("install.packagesggplot2")

# LOAD LIBRARY
library(ggplot2)

# IMPORT DATA
sales_data <- read.csv("sales_data.csv")

# =========================
# Q1 BASIC CHARTS
# =========================

# a) Scatter Plot
ggplot(sales_data, aes(x=Price, y=Revenue)) +
  geom_point()

# b) Bar Chart
ggplot(sales_data, aes(x=City)) +
  geom_bar()

# c) Histogram
ggplot(sales_data, aes(x=Price)) +
  geom_histogram(bins=20)

# d) Boxplot
ggplot(sales_data, aes(x=Category, y=Revenue)) +
  geom_boxplot()

# e) Line Chart
ggplot(sales_data, aes(x=OrderID, y=Revenue)) +
  geom_line()

# =========================
# Q2 CUSTOMIZATION
# =========================

ggplot(sales_data, aes(x=City)) +
  geom_bar(fill="blue") +
  labs(title="City Orders",
       x="City",
       y="Count") +
  theme_minimal()

# Rotate labels
ggplot(sales_data, aes(x=City)) +
  geom_bar(fill="red") +
  theme(axis.text.x = element_text(angle=45))

# =========================
# Q3 MULTI VARIABLE
# =========================

# a) Price vs Revenue
ggplot(sales_data, aes(x=Price, y=Revenue, color=Category)) +
  geom_point()

# b) Price vs Quantity
ggplot(sales_data, aes(x=Price, y=Quantity, color=Category)) +
  geom_point()

# c) Revenue vs Discount
ggplot(sales_data, aes(x=Discount, y=Revenue)) +
  geom_point()

# d) Top cities revenue
city_rev <- aggregate(Revenue ~ City, sales_data, sum)

ggplot(city_rev, aes(x=City, y=Revenue)) +
  geom_bar(stat="identity")

# e) Product sales
product_sales <- aggregate(Quantity ~ Product, sales_data, sum)

ggplot(product_sales, aes(x=Product, y=Quantity)) +
  geom_bar(stat="identity")

# =========================
# Q4 ANALYSIS CHARTS
# =========================

# a) Orders per city
ggplot(sales_data, aes(x=City)) +
  geom_bar()

# b) Price vs Revenue
ggplot(sales_data, aes(x=Price, y=Revenue)) +
  geom_point()

# c) Quantity vs Revenue
ggplot(sales_data, aes(x=Quantity, y=Revenue)) +
  geom_point()

# d) Quantity Histogram
ggplot(sales_data, aes(x=Quantity)) +
  geom_histogram()

# e) Histogram by Category
ggplot(sales_data, aes(x=Revenue, fill=Category)) +
  geom_histogram()

# =========================
# Q5 BOXPLOT AND FACET
# =========================

# a) Revenue by Category
ggplot(sales_data, aes(x=Category, y=Revenue)) +
  geom_boxplot()

# b) Price by Product
ggplot(sales_data, aes(x=Product, y=Price)) +
  geom_boxplot()

# c) Revenue Trend
ggplot(sales_data, aes(x=OrderID, y=Revenue)) +
  geom_line()

# d) Discount Trend
ggplot(sales_data, aes(x=OrderID, y=Discount)) +
  geom_line()

# e) Faceted Chart
ggplot(sales_data, aes(x=City)) +
  geom_bar() +
  facet_wrap(~Category)