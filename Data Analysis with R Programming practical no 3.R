# PRACTICAL 3
# ADVANCED DATA MANIPULATION TECHNIQUES IN R

# CREATE DATASET

set.seed(123)

sales_data <- data.frame(
  
  OrderID = 1:200,
  
  CustomerName = sample(
    c("Rahul","Amit","Priya","Neha","Arjun","Sneha","Rohit","Kiran"),
    200,
    replace=TRUE
  ),
  
  City = sample(
    c("Pune","Mumbai","Delhi","Bangalore","Hyderabad"),
    200,
    replace=TRUE
  ),
  
  Product = sample(
    c("Laptop","Mobile","Tablet","Shoes","Watch"),
    200,
    replace=TRUE
  ),
  
  Category = sample(
    c("Electronics","Fashion"),
    200,
    replace=TRUE
  ),
  
  Quantity = sample(1:10,200,replace=TRUE),
  
  Price = sample(seq(500,50000,500),200,replace=TRUE),
  
  Discount = sample(c(0,5,10,15,20),200,replace=TRUE),
  
  PaymentMethod = sample(
    c("Cash","Card","UPI"),
    200,
    replace=TRUE
  )
  
)

sales_data$Revenue <-
  sales_data$Quantity * sales_data$Price

sales_data$DiscountAmount <-
  sales_data$Revenue * sales_data$Discount/100

sales_data$FinalAmount <-
  sales_data$Revenue - sales_data$DiscountAmount

# LOAD LIBRARY

library(dplyr)

# =========================
# Q1 RECODING VARIABLES
# =========================

# a) Create OrderSize

sales_data$OrderSize <-
  ifelse(
    sales_data$Quantity <= 3,
    "Small",
    
    ifelse(
      sales_data$Quantity <= 7,
      "Medium",
      "Large"
    )
  )

# b) Sort by Quantity descending

sorted_quantity <-
  sales_data[
    order(-sales_data$Quantity),
  ]

head(sorted_quantity)

# c) Sort by City and Revenue

sorted_city_revenue <-
  sales_data[
    order(
      sales_data$City,
      sales_data$Revenue
    ),
  ]

head(sorted_city_revenue)

# d) Create Tax column

sales_data$Tax <-
  sales_data$FinalAmount * 0.18

# e) Create TotalBill

sales_data$TotalBill <-
  sales_data$FinalAmount +
  sales_data$Tax

head(sales_data)

# =========================
# Q2 SELECT AND FILTER
# =========================

# a) Select CustomerName and Product

select_data <-
  select(
    sales_data,
    CustomerName,
    Product
  )

head(select_data)

# b) Select numeric columns

numeric_data <-
  select_if(
    sales_data,
    is.numeric
  )

head(numeric_data)

# c) Remove Discount column

remove_discount <-
  select(
    sales_data,
    -Discount
  )

head(remove_discount)

# d) Filter Pune customers

pune_customers <-
  filter(
    sales_data,
    City == "Pune"
  )

head(pune_customers)

# e) Multiple conditions

high_sales <-
  filter(
    sales_data,
    Price > 20000 &
      Quantity > 5
  )

head(high_sales)

# =========================
# Q3 MUTATE AND ARRANGE
# =========================

# a) Create Tax variable

sales_data <-
  sales_data %>%
  mutate(
    Tax = FinalAmount * 0.18
  )

head(sales_data)

# b) Create Profit variable

sales_data <-
  sales_data %>%
  mutate(
    Profit = FinalAmount * 0.20
  )

head(sales_data)

# c) Create OrderCategory

sales_data <-
  sales_data %>%
  mutate(
    OrderCategory =
      ifelse(
        Revenue > 100000,
        "High",
        "Low"
      )
  )

head(sales_data)

# d) Create DiscountCategory

sales_data <-
  sales_data %>%
  mutate(
    DiscountCategory =
      ifelse(
        Discount >= 10,
        "High Discount",
        "Low Discount"
      )
  )

head(sales_data)

# e) Create PaymentType

sales_data <-
  sales_data %>%
  mutate(
    PaymentType =
      ifelse(
        PaymentMethod == "Cash",
        "Offline",
        "Online"
      )
  )

head(sales_data)

# f) Sort by Revenue descending

revenue_sort <-
  sales_data %>%
  arrange(
    desc(Revenue)
  )

head(revenue_sort)

# =========================
# Q4 GROUP BY AND SUMMARISE
# =========================

# a) Total revenue by city

city_revenue <-
  sales_data %>%
  group_by(City) %>%
  summarise(
    TotalRevenue =
      sum(Revenue)
  )

city_revenue

# b) Average price by product

average_price <-
  sales_data %>%
  group_by(Product) %>%
  summarise(
    AveragePrice =
      mean(Price)
  )

average_price

# c) Total quantity by product

total_quantity <-
  sales_data %>%
  group_by(Product) %>%
  summarise(
    TotalQuantity =
      sum(Quantity)
  )

total_quantity

# d) Maximum revenue by city

maximum_revenue <-
  sales_data %>%
  group_by(City) %>%
  summarise(
    MaximumRevenue =
      max(Revenue)
  )

maximum_revenue

# e) Minimum revenue by product

minimum_revenue <-
  sales_data %>%
  group_by(Product) %>%
  summarise(
    MinimumRevenue =
      min(Revenue)
  )

minimum_revenue

# =========================
# Q5 CUSTOMER ANALYSIS
# =========================

# a) Count orders per customer

customer_orders <-
  sales_data %>%
  group_by(CustomerName) %>%
  summarise(
    TotalOrders = n()
  )

customer_orders

# b) Total revenue per customer

customer_revenue <-
  sales_data %>%
  group_by(CustomerName) %>%
  summarise(
    TotalRevenue =
      sum(Revenue)
  )

customer_revenue

# c) Average order value

average_order <-
  sales_data %>%
  group_by(CustomerName) %>%
  summarise(
    AverageOrderValue =
      mean(FinalAmount)
  )

average_order

# d) Top customer

top_customer <-
  sales_data %>%
  group_by(CustomerName) %>%
  summarise(
    TotalRevenue =
      sum(Revenue)
  ) %>%
  arrange(
    desc(TotalRevenue)
  )

top_customer

# e) Sort customers by revenue

sorted_customers <-
  sales_data %>%
  group_by(CustomerName) %>%
  summarise(
    TotalRevenue =
      sum(Revenue)
  ) %>%
  arrange(
    desc(TotalRevenue)
  )

sorted_customers