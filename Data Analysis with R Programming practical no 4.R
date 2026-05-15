# ASSIGNMENT 4
# DATA MANAGEMENT AND MANIPULATION IN R

# LOAD LIBRARIES
library(readxl)
library(writexl)

# IMPORT CSV FILE
sales_data <- read.csv("sales_data.csv")

# IMPORT EXCEL FILE
sales_data_excel <- read_excel("sales_data.xlsx")

# =========================
# Q1 IMPORTING AND EXPLORING DATA
# =========================

# a) Display first 10 rows
head(sales_data,10)

# b) Display last 10 rows
tail(sales_data,10)

# c) Structure of dataset
str(sales_data)

# d) Summary statistics
summary(sales_data)

# =========================
# Q2 EXPORTING DATA
# =========================

# a) Export dataset to CSV
write.csv(sales_data,"output.csv",row.names=FALSE)

# b) Export dataset to Excel
write_xlsx(sales_data,"output.xlsx")

# c) Export Electronics category
electronics <- subset(sales_data, Category=="Electronics")
write.csv(electronics,"electronics.csv",row.names=FALSE)

# d) Export Pune customers
pune_data <- subset(sales_data, City=="Pune")
write.csv(pune_data,"pune.csv",row.names=FALSE)

# e) Export top 20 rows
top20 <- head(sales_data,20)
write.csv(top20,"top20.csv",row.names=FALSE)

# =========================
# Q3 MODIFYING DATA
# =========================

# a) Create Profit column
sales_data$Profit <- sales_data$Revenue * 0.20

# b) Rename FinalAmount column
names(sales_data)[names(sales_data)=="FinalAmount"] <- "TotalAmount"

# c) Remove DiscountAmount column
sales_data$DiscountAmount <- NULL

# d) Add Tax column
sales_data$Tax <- sales_data$Revenue * 0.18

# e) Quantity greater than 5
subset(sales_data, Quantity > 5)

# =========================
# Q4 COLUMN SELECTION
# =========================

# a) Select CustomerName and Product
sales_data[,c("CustomerName","Product")]

# b) Select first 5 columns
sales_data[,1:5]

# c) Select numeric columns
sales_data[sapply(sales_data,is.numeric)]

# d) Remove Discount column
sales_data$Discount <- NULL

# e) Select columns using index
sales_data[,c(2,4,6)]

# =========================
# Q5 SORTING AND AGGREGATION
# =========================

# a) Sort by City
sales_data[order(sales_data$City),]

# b) Sort by City and Revenue
sales_data[order(sales_data$City,sales_data$Revenue),]

# c) Average price by city
aggregate(Price ~ City, sales_data, mean)

# d) Maximum order value by city
aggregate(Revenue ~ City, sales_data, max)

# e) Total quantity sold by city
aggregate(Quantity ~ City, sales_data, sum)