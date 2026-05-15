# PRACTICAL 1
# INTRODUCTION TO R AND BASIC OPERATIONS

# =========================
# Q1 ARITHMETIC OPERATIONS
# =========================

# a) Input numbers

a <- 10
b <- 5

# b) Arithmetic operations

add <- a + b
sub <- a - b
mul <- a * b
div <- a / b
power <- a ^ b
mod <- a %% b

# c) Store results in vector

results <- c(
  add,
  sub,
  mul,
  div,
  power,
  mod
)

results

# d) Maximum value

max(results)

# e) Minimum and average

min(results)

mean(results)

# =========================
# Q2 RANDOM NUMBERS
# =========================

# a) Generate random numbers

numbers <- sample(1:100,10)

# b) Square root

sqrt_values <- sqrt(numbers)

# c) Rounded values

round_values <- round(sqrt_values)

# d) Ceiling values

ceiling_values <- ceiling(sqrt_values)

# e) Floor values

floor_values <- floor(sqrt_values)

# Create data frame

result_df <- data.frame(
  Numbers = numbers,
  SquareRoot = sqrt_values,
  Rounded = round_values,
  Ceiling = ceiling_values,
  Floor = floor_values
)

result_df

# =========================
# Q3 STRING FUNCTIONS
# =========================

# a) Create names list

names_list <- c(
  "Rahul",
  "Sachin",
  "Amit",
  "Priya"
)

# b) Convert to uppercase

upper_names <- toupper(names_list)

# c) Count characters

name_length <- nchar(upper_names)

# d) Create sentence

result <- paste(
  upper_names,
  "has",
  name_length,
  "characters"
)

# e) Display result

result

# =========================
# Q4 DIVISIBLE NUMBERS
# =========================

# a) Numbers from 1 to 200

numbers <- 1:200

# b) Divisible by 3 and 5

selected <- numbers[
  numbers %% 3 == 0 &
    numbers %% 5 == 0
]

# c) Square and square root

square <- selected^2

square_root <- sqrt(selected)

# d) Create table

result_table <- data.frame(
  Number = selected,
  Square = square,
  SquareRoot = square_root
)

# e) Display table

result_table

# =========================
# Q5 QUADRATIC EQUATION
# =========================

# a) Values

a <- 1
b <- 4
c <- 5

# b) Discriminant

D <- b^2 - 4*a*c

# c) Root 1

root1 <-
  (-b + sqrt(as.complex(D))) /
  (2*a)

# d) Root 2

root2 <-
  (-b - sqrt(as.complex(D))) /
  (2*a)

# e) Display roots

root1
root2

# =========================
# Q6 DIVISIBLE NUMBERS
# =========================

# a) Numbers from 1 to 200

num <- 1:200

# b) Divisible by 3 or 7

x <- num[
  num %% 3 == 0 |
    num %% 7 == 0
]

x

# c) Divisible by 3 and 7

y <- num[
  num %% 3 == 0 &
    num %% 7 == 0
]

y

# =========================
# Q7 MISSING VALUES
# =========================

# a) Create vector

x <- c(
  10,
  20,
  NA,
  30,
  NA,
  40
)

# b) Sum ignoring NA

sum(
  x,
  na.rm=TRUE
)

# c) Mean ignoring NA

mean(
  x,
  na.rm=TRUE
)