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

#lis