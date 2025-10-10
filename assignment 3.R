# =====================================================
# 📊 Complete R Program: Dataset + Cleaning + Transformation + EDA + Visualization
# =====================================================

# Load Required Libraries
library(dplyr)
library(ggplot2)
library(psych)

# -----------------------------------------------------
# 1️⃣ Create Dataset (500 rows × 7 columns)
# -----------------------------------------------------
set.seed(123)  # for reproducibility

data <- data.frame(
  ID = 1:500,
  Age = sample(18:60, 500, replace = TRUE),
  Gender = sample(c("Male", "Female"), 500, replace = TRUE),
  Income = round(rnorm(500, mean = 55000, sd = 12000), 2),
  Score = round(runif(500, 40, 100), 1),
  City = sample(c("Lahore", "Karachi", "Islamabad", "Multan", "Faisalabad"), 500, replace = TRUE),
  Experience = sample(0:30, 500, replace = TRUE)
)

# Introduce some missing values
for (i in 2:5) {
  data[sample(1:500, 15), i] <- NA
}

head(data)

# -----------------------------------------------------
# 2️⃣ Data Cleaning
# -----------------------------------------------------

# Check missing values
colSums(is.na(data))

# Replace missing numeric values with mean
data$Age[is.na(data$Age)] <- mean(data$Age, na.rm = TRUE)
data$Income[is.na(data$Income)] <- mean(data$Income, na.rm = TRUE)
data$Score[is.na(data$Score)] <- mean(data$Score, na.rm = TRUE)

# Check duplicates and remove if any
data <- distinct(data)

# Outlier treatment (Income)
q <- quantile(data$Income, c(0.01, 0.99))
data$Income <- ifelse(data$Income < q[1], q[1],
                      ifelse(data$Income > q[2], q[2], data$Income))

# -----------------------------------------------------
# 3️⃣ Data Transformation
# -----------------------------------------------------

# Create a new categorical variable (Income_Level)
data <- data %>%
  mutate(Income_Level = case_when(
    Income < 45000 ~ "Low",
    Income >= 45000 & Income < 65000 ~ "Medium",
    TRUE ~ "High"
  ))

# Standardize numeric columns
data <- data %>%
  mutate(Scaled_Income = scale(Income),
         Scaled_Score = scale(Score))

head(data)

# -----------------------------------------------------
# 4️⃣ Exploratory Data Analysis (EDA)
# -----------------------------------------------------

## 🔹Questions
# Q1: What is the average income?
mean(data$Income)

# Q2: Which city has highest average score?
data %>% group_by(City) %>%
  summarise(Average_Score = mean(Score)) %>%
  arrange(desc(Average_Score))

# Q3: Gender distribution?
table(data$Gender)

## 🔹Measurement (Summary Statistics)
describe(select(data, Age, Income, Score, Experience))

## 🔹Univariate Analysis
summary(data$Age)
summary(data$Income)
summary(data$Score)

# -----------------------------------------------------
# 5️⃣ Visualization
# -----------------------------------------------------

# 1. Histogram of Age
ggplot(data, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
  ggtitle("Age Distribution") +
  theme_minimal()

# 2. Gender Count
ggplot(data, aes(x = Gender, fill = Gender)) +
  geom_bar() +
  ggtitle("Gender Distribution") +
  theme_minimal()

# 3. Boxplot of Income by Gender
ggplot(data, aes(x = Gender, y = Income, fill = Gender)) +
  geom_boxplot() +
  ggtitle("Income by Gender") +
  theme_minimal()

# 4. Scatter Plot: Age vs Income
ggplot(data, aes(x = Age, y = Income, color = Gender)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE) +
  ggtitle("Age vs Income") +
  theme_minimal()

# 5. Bar plot of Average Score by City
data %>%
  group_by(City) %>%
  summarise(Avg_Score = mean(Score)) %>%
  ggplot(aes(x = City, y = Avg_Score, fill = City)) +
  geom_col() +
  ggtitle("Average Score by City") +
  theme_minimal()

# -----------------------------------------------------
# ✅ End of Program
# -----------------------------------------------------
