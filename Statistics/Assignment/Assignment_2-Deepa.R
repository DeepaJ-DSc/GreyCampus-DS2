
# 1. 

France <- 4
Croatia <- 2

#ifelse (France>Croatia, print("Team France Wins"),print("Team Croatia Wins"))

if(France > Croatia){
  print("Team France Wins") 
} else {
  print("Team Croatia Wins")
}

# 2. Convert numeric to factor 

head (mtcars)

str(mtcars)
#mtcars$cyl <- as.factor(mtcars$cyl)

for (i in 8:11){
  mtcars[,i] <- as.factor(mtcars[,i])
}
str(mtcars)


# 3.

install.packages("readxl")

library("readxl")

my_data <- read_xlsx(file.choose())

head(my_data)

str(my_data)

colSums(is.na(my_data))
rowSums(is.na(my_data))
ncol(my_data)
nrow(my_data)

sum(is.na(my_data))

# Percentage of NA in each column

napercol <- function(x){
  (colSums(is.na(x))/ncol(x))*100
}

napercol(my_data)

# 4. Percentage of NA in each row

naperrow <- function(y){
  (rowSums(is.na(y))/nrow(y))*100
}

naperrow(my_data)

# Please let me know what is the problem with this approach as I am not getting
# the same output as the method discussed in the class.

# 5. Summary of numeric columns and boxplot

sum_data <- function(y){
  print(summary(y))
  boxplot(y)
}

sum_data(my_data$CO)
sum_data(my_data$CO2)
sum_data(my_data$THC)

# 6. Create histograms

library(ggplot2)

data_his <- function (x,y){
  ggplot(x)+
    aes(y) +
    geom_histogram()
}
  
data_his (my_data, my_data$CO)

data_his (my_data, my_data$CO2)

data_his (my_data, my_data$THC)

# Did not attempt the date related questions as I did not understand it 
# while doing the assignment before the in class discussions.
