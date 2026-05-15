# PRACTICAL 2
# DATA STRUCTURES AND CONTROL STRUCTURES IN R

# CREATE DATASET

set.seed(123)

sales_data <- data.frame(
  
  OrderID = 1:100,
  
  CustomerName = sample(
    c("Rahul","Amit","Priya","Neha","Arjun","Sneha","Rohit","Kiran"),
    100,
    replace=TRUE
  ),
  
  City = sample(
    c("Pune","Mumbai","Delhi","Bangalore","Hyderabad"),
    100,
    replace=TRUE
  ),
  
  Product = sample(
    c("Laptop","Mobile","Tablet","Shoes","Watch"),
    100,
    replace=TRUE
  ),
  
  Category = sample(
    c("Electronics","Fashion"),
    100,
    replace=TRUE
  ),
  
  Quantity = sample(1:10,100,replace=TRUE),
  
  Price = sample(seq(500,50000,500),100,replace=TRUE),
  
  Discount = sample(c(0,5,10,15,20),100,replace=TRUE),
  
  PaymentMethod = sample(
    c("Cash","Card","UPI"),
    100,
    replace=TRUE
  )
  
)

sales_data$Revenue <-
  sales_data$Quantity * sales_data$Price

sales_data$DiscountAmount <-
  sales_data$Revenue *
  sales_data$Discount / 100

sales_data$FinalAmount <-
  sales_data$Revenue -
  sales_data$DiscountAmount

head(sales_data)

# =========================
# Q1 FILTERING ROWS
# =========================

# a) Price > 20000

high_price_orders <-
  sales_data[
    sales_data$Price > 20000,
  ]

head(high_price_orders)

# b) City = Pune

pune_orders <-
  sales_data[
    sales_data$City == "Pune",
  ]

head(pune_orders)

# c) Quantity > 5

high_quantity_orders <-
  sales_data[
    sales_data$Quantity > 5,
  ]

head(high_quantity_orders)

# d) Category = Electronics

electronics_orders <-
  sales_data[
    sales_data$Category == "Electronics",
  ]

head(electronics_orders)

# e) Multiple conditions

combined_orders <-
  sales_data[
    sales_data$Price > 20000 &
      sales_data$Quantity > 5,
  ]

head(combined_orders)

# =========================
# Q2 SORTING DATA
# =========================

# a) Sort by Price

sales_data_price <-
  sales_data[
    order(sales_data$Price),
  ]

head(sales_data_price)

# b) Sort by Revenue

sales_data_revenue <-
  sales_data[
    order(sales_data$Revenue),
  ]

head(sales_data_revenue)

# c) Sort by City

sales_data_city <-
  sales_data[
    order(sales_data$City),
  ]

head(sales_data_city)

# d) Sort by Quantity descending

sales_data_quantity <-
  sales_data[
    order(-sales_data$Quantity),
  ]

head(sales_data_quantity)

# e) Multiple column sorting

sales_data_multi <-
  sales_data[
    order(
      sales_data$City,
      sales_data$Price
    ),
  ]

head(sales_data_multi)

# =========================
# Q3 AGGREGATION
# =========================

# a) Total revenue by city

aggregate(
  Revenue ~ City,
  data=sales_data,
  sum
)

# b) Average price by category

aggregate(
  Price ~ Category,
  data=sales_data,
  mean
)

# c) Total quantity by product

aggregate(
  Quantity ~ Product,
  data=sales_data,
  sum
)

# d) Maximum order value by city

aggregate(
  FinalAmount ~ City,
  data=sales_data,
  max
)

# e) Minimum order value by product

aggregate(
  FinalAmount ~ Product,
  data=sales_data,
  min
)

# =========================
# Q4 CONDITIONAL STATEMENTS
# =========================

# a) Discount status

sales_data$Discount_Status <-
  ifelse(
    sales_data$Discount > 10,
    "High Discount",
    "Low Discount"
  )

head(sales_data)

# b) Order value category

sales_data$Order_Value <-
  ifelse(
    sales_data$FinalAmount > 30000,
    "High",
    
    ifelse(
      sales_data$FinalAmount > 15000,
      "Medium",
      "Low"
    )
  )

head(sales_data)

# c) Print revenue using for loop

for(i in 1:10)
{
  print(sales_data$Revenue[i])
}

# d) Cumulative revenue using while loop

i <- 1

total <- 0

while(i <= nrow(sales_data))
{
  total <- total +
    sales_data$Revenue[i]
  
  i <- i + 1
}

total

# e) Skip Fashion category

for(i in 1:nrow(sales_data))
{
  
  if(sales_data$Category[i] == "Fashion")
  {
    next
  }
  
  print(head(sales_data[i, ]))
  
}

# =========================
# Q5 DISCOUNT ANALYSIS
# =========================

# a) Average discount

mean(sales_data$Discount)

# b) Discount > 10

sales_data[
  sales_data$Discount > 10,
]

# c) Total discount amount

sum(sales_data$DiscountAmount)

# d) Discount by city

aggregate(
  DiscountAmount ~ City,
  data=sales_data,
  sum
)

# e) City with highest discount

agg <-
  aggregate(
    DiscountAmount ~ City,
    data=sales_data,
    sum
  )

agg[
  which.max(agg$DiscountAmount),
]

# =========================
# Q6 MULTI CONDITION FILTERING
# =========================

# a) Electronics + Price > 20000

sales_data[
  sales_data$Category == "Electronics" &
    sales_data$Price > 20000,
]

# b) Fashion + Quantity > 5

sales_data[
  sales_data$Category == "Fashion" &
    sales_data$Quantity > 5,
]

# c) Pune + Discount > 10

sales_data[
  sales_data$City == "Pune" &
    sales_data$Discount > 10,
]

# d) Revenue > 50000 + Cash payment

sales_data[
  sales_data$Revenue > 50000 &
    sales_data$PaymentMethod == "Cash",
]

# e) High price + high quantity

sales_data[
  sales_data$Price > 20000 &
    sales_data$Quantity > 5,
]