# ASSIGNMENT 8
# WORKING WITH CSV AND EXCEL FILES

# INSTALL PACKAGES
install.packages("readxl")
install.packages("writexl")

# LOAD LIBRARIES
library(readxl)
library(writexl)

# IMPORT CSV FILE
sales_data <- read.csv("sales_data.csv")

# IMPORT EXCEL FILE
sales_excel <- read_excel("sales_data.xlsx")

# =========================
# Q1 IMPORTING DATA
# =========================

# a) View first 10 rows
head(sales_data,10)

# b) View last 10 rows
tail(sales_data,10)

# c) Structure of dataset
str(sales_data)

# d) Summary statistics
summary(sales_data)

# e) Column names
names(sales_data)

# =========================
# Q2 EXPORTING DATA
# =========================

# a) Export CSV
write.csv(sales_data,
          "new_sales.csv",
          row.names=FALSE)

# b) Export Excel
write_xlsx(sales_data,
           "new_sales.xlsx")

# c) Export top 20 rows
top20 <- head(sales_data,20)

write.csv(top20,
          "top20.csv",
          row.names=FALSE)

# d) Export Pune data
pune_data <- subset(
  sales_data,
  City=="Pune"
)

write.csv(pune_data,
          "pune.csv",
          row.names=FALSE)

# e) Export Electronics category
electronics <- subset(
  sales_data,
  Category=="Electronics"
)

write.csv(electronics,
          "electronics.csv",
          row.names=FALSE)

# =========================
# Q3 DATA FILTERING
# =========================

# a) Revenue greater than 50000
subset(sales_data,
       Revenue > 50000)

# b) Quantity greater than 5
subset(sales_data,
       Quantity > 5)

# c) Female customers
subset(sales_data,
       Gender=="Female")

# d) Delhi customers
subset(sales_data,
       City=="Delhi")

# e) Fashion category
subset(sales_data,
       Category=="Fashion")

# =========================
# Q4 DATA SORTING
# =========================

# a) Sort by City
sales_data[
  order(sales_data$City),
]

# b) Sort by Revenue
sales_data[
  order(sales_data$Revenue),
]

# c) Sort by Quantity
sales_data[
  order(sales_data$Quantity),
]

# d) Sort by Price
sales_data[
  order(sales_data$Price),
]

# e) Sort by Age
sales_data[
  order(sales_data$Age),
]

# =========================
# Q5 DATA ANALYSIS
# =========================

# a) Total Revenue
sum(sales_data$Revenue)

# b) Average Revenue
mean(sales_data$Revenue)

# c) Maximum Revenue
max(sales_data$Revenue)

# d) Minimum Revenue
min(sales_data$Revenue)

# e) Revenue by Region
aggregate(
  Revenue ~ Region,
  sales_data,
  sum
)