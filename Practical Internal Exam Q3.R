#practical question no3:statiscal Analysis & Tables

# Create dataset
data <- data.frame(
  Gender = c("Male","Female","Male","Female","Male","Female"),
  Purchase = c("Yes","No","Yes","Yes","No","Yes"),
  Amount = c(5000,7000,8000,6000,4000,9000)
)

# Display dataset
print(data)

# Mean
mean(data$Amount)

# Median
median(data$Amount)

# Frequency table
table(data$Gender)

# Cross tabulation
table(data$Gender, data$Purchase)

# Total purchase amount by gender
aggregate(Amount ~ Gender, data, sum)

# Count Yes purchases
sum(data$Purchase == "Yes")