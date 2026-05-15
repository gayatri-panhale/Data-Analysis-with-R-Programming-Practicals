# Create dataframe
df <- data.frame(
  name = c("Raj","Amit","Neha","raj","Amit"),
  marks = c("80","90","NA","85","90"),
  city = c("Pune","pune","Mumbai","PUNE","Mumbai")
)

# Display original data
print(df)

# 1. Remove extra spaces from name column
df$name <- trimws(df$name)

# 2. Convert all names to lowercase
df$name <- tolower(df$name)

# 3. Convert marks column to numeric and handle missing values

# Convert "NA" text into actual NA value
df$marks[df$marks == "NA"] <- NA

# Convert marks into numeric
df$marks <- as.numeric(df$marks)

# Replace missing values with average marks
df$marks[is.na(df$marks)] <- mean(df$marks, na.rm = TRUE)

# 4. Convert city names into lowercase
df$city <- tolower(df$city)

# 5. Filter students with marks greater than 80
filtered_df <- df[df$marks > 80, ]

# 6. Create grade column
df$grade <- ifelse(df$marks > 85, "A", "B")

# Display cleaned dataframe
print(df)

# Display filtered students
print(filtered_df)