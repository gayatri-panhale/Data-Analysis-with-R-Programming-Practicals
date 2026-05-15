# ASSIGNMENT 9
# S3 AND S4 CLASSES IN R

# =========================
# Q1 S3 CLASS
# =========================

# a) Create S3 object
student <- list(
  name = "Aryan",
  age = 18,
  marks = 85
)

# b) Assign class
class(student) <- "Student"

# c) Display object
student

# d) Check class
class(student)

# e) Structure
str(student)

# =========================
# Q2 S3 FUNCTION
# =========================

# a) Create object
employee <- list(
  name = "Rahul",
  salary = 50000
)

# b) Assign class
class(employee) <- "Employee"

# c) Print function
print.Employee <- function(x)
{
  cat("Employee Name :",x$name,"\n")
  cat("Salary :",x$salary)
}

# d) Print object
employee

# e) Check class
class(employee)

# =========================
# Q3 S4 CLASS
# =========================

# a) Create S4 class
setClass(
  "Person",
  slots = list(
    name = "character",
    age = "numeric"
  )
)

# b) Create object
p1 <- new(
  "Person",
  name = "Amit",
  age = 22
)

# c) Display object
p1

# d) Access slot
p1@name

# e) Access age
p1@age

# =========================
# Q4 S4 EMPLOYEE CLASS
# =========================

# a) Create class
setClass(
  "Employee",
  slots = list(
    name = "character",
    salary = "numeric"
  )
)

# b) Create object
e1 <- new(
  "Employee",
  name = "Neha",
  salary = 60000
)

# c) Display object
e1

# d) Access name
e1@name

# e) Access salary
e1@salary

# =========================
# Q5 DATA FRAME OPERATIONS
# =========================

# a) Create data frame
data <- data.frame(
  Name = c("A","B","C"),
  Marks = c(80,85,90)
)

# b) Display data
data

# c) Structure
str(data)

# d) Summary
summary(data)

# e) Mean marks
mean(data$Marks)