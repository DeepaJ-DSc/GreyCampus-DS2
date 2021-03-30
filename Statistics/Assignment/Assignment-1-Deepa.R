# ASSIGNMENT 1

#1. VECTOR AND MATRIX
#   SIMILARITY: Vector and matrix both are data structures that 
#               contain elements of the same data type.
#   DIFFERENCE: Vector is one dimensional whereas Matrix is two dimensional.

#2. DATAFRAME AND MATRIX
#   SIMILARITY: Dataframe and matrix are both two dimensional data structures.
#   DIFFERENCE: Matrix contains elements of the same data type, whereas 
#               dataframe is used for different types of variables.

#3. Create vector
dat_vector <- c(15, TRUE, "World")
dat_vector
# Since it was a mixed vector having different types of data, all the objects
# were coerced to the CHARACTER data type.

#4. John's score and subjects
John_score_vector <- c(95,91,88)
John_score_vector

Subject_vector <- c("Statistics", "Linear Algebra", "Calculus")
Subject_vector

names(John_score_vector) <- Subject_vector
John_score_vector

#5. Check types

typeof(John_score_vector)
class(John_score_vector)

typeof(Subject_vector)
class(Subject_vector)

#6. Matrix of 3 students data, add column names and row names

Rohit_score_vector <- c(95,91,88)
Simran_score_vector <- c(96,94,97)
Kabir_score_vector <- c(88,98,85)

Student_vector <- c("Rohit", "Simran", "Kabir")

Student_score_vector <- c(Rohit_score_vector, Simran_score_vector, Kabir_score_vector)
Student_score_vector

Student_score_matrix <- matrix(Student_score_vector, nrow = 3, byrow = TRUE)
Student_score_matrix

colnames(Student_score_matrix) <- Subject_vector
rownames(Student_score_matrix) <- Student_vector

Student_score_matrix

#7. Convert matrix to data frame

Student <- c("Rohit", "Simran", "Kabir")
Statistics <- c(95,96,88)
LinearAlgebra <- c(91,94,98)
Calculus <- c(88,97,85)

Student_score_df <- data.frame(Student, Statistics, LinearAlgebra, Calculus)
Student_score_df

#8. Create a dataframe of Countries, cases, deaths

Country <- c("USA", "India", "UK", "France", "Germany")
Total_cases <- c(28537351, 10976388, 4095269, 3536648, 2373848)
Total_deaths <- c(505632, 156237, 119920, 83393, 67638)

Country_cases_df <- data.frame (Country, Total_cases, Total_deaths)
Country_cases_df

