#question no 2
#creating data set
emp <- data.frame(
  Emp_ID = c("E1","E2","E3","E4","E5","E6","E7","E8"),
  Name   = c("X","Y","Z","X","Y","Z","X","Y"),
  Age    = c(34,29,40,30,35,27,41,30),
  Dept   = c("HR","IT","Finance","Marketing","HR","IT","Finance","Marketing"),
  Salary = c(50000,60000,70000,80000,50000,65000,45000,60000),
  Gender = c("Male","Female","Male","Female","Male","Female","Male","Female"),
  Experience = c(5,3,10,4,2,7,9,6)
)
#average salary
salary_vec <- emp$Salary
mean_salary <- mean(salary_vec)
mean_salary

#minimum and maximum age
age_vec <- emp$Age
min_age <- min(age_vec)
max_age <- max(age_vec)
min_age
max_age

#employee list
emp_E1 <- list(Name = "X", Department = "HR", Age = 34, Salary = 50000)

emp_E1$Name
emp_E1$Department
emp_E1$Age
emp_E1$Salary

#mean, standard deviation, and correlation(Salary and Experience)mean_salary <- mean(emp$Salary)
sd_salary <- sd(emp$Salary)

mean_exp <- mean(emp$Experience)
sd_exp <- sd(emp$Experience)

cor_salary_exp <- cor(emp$Salary, emp$Experience)

mean_salary; sd_salary; mean_exp; sd_exp; cor_salary_exp





#question no 3
library(ggplot2)
data(mtcars)
mtcars$carname <- rownames(mtcars)
# Scatter plot with trend line
ggplot(mtcars, aes(x = hp, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE) +
  labs(title = "Horsepower vs MPG",
       x = "Horsepower (hp)",
       y = "Miles per Gallon (mpg)") +
  theme_minimal()

# Box plot 
ggplot(mtcars, aes(x = factor(cyl), y = mpg)) +
  geom_boxplot() +
  labs(title = "MPG by Number of Cylinders",
       x = "Cylinders",
       y = "Miles per Gallon (mpg)") +
  theme_minimal()

# Histogram
ggplot(mtcars, aes(x = wt)) +
  geom_histogram(bins = 8) +
  labs(title = "Distribution of Car Weights",
       x = "Weight (1000 lbs)",
       y = "Count") +
  theme_minimal()
#check correlation with numarically
cor(mtcars$hp, mtcars$mpg)  # Check correlation numerically
summary(mtcars$mpg)
table(mtcars$cyl)


