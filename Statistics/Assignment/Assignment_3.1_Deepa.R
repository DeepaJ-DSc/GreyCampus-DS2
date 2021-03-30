
install.packages("tidyverse")
library(tidyverse)

install.packages("diplyr")
library(diplyr)

library(gapminder)

# 1. Import the raw data
data_set <- read.csv("F:/GreyCampus-Datascience/27-28-Feb-Stat/COVID19.csv")
data_set

colnames(data_set)

data_set$Country.Other

# 2. Remove the first 8 and last 8 rows from the dataset
clean_1 <- slice(data_set,9:229)

#3. Remove the first column as it is not useful
clean_1 <- select(clean_1, -1)
clean_1

#4. Replace all null values with "NA"
clean_1[clean_1==""|clean_1==" "]<-NA
clean_1


#5. Remove columns where percentage of NA values is greater than 5
# (In this case, column "Total Deaths" is also removed.
# Hence, going ahead with removing columns where missing values is greater than 10%)


temp <- colMeans(is.na.data.frame(clean_1))
temp

clean_2 <- clean_1[,!sapply(clean_1, function(x) mean(is.na(x)))>0.1]
clean_2

colnames(clean_2)

#6. Renaming columns

colnames(clean_2) <- c("No", "Country", "TotalCases", "TotalDeaths", "TotalRecovered",
                       "ActiveCases", "CasesPerMillionPop", "DeathsPerMillionPop", 
                       "TotalTests", "TestsPerMillionPop", "Population", "Continent", 
                       "CasesPerXPop", "DeathsPerXPop", "TestsPerXPop")
colnames(clean_2)

str(clean_2)

#7. Converting Continent column to factor type and other chr columns to numeric

clean_2$Continent <- as.factor(clean_2$Continent)

for(i in c(3:11,13:15)) {
  clean_2[,i] <- gsub(",","",clean_2[,i])
  clean_2[,i] <- gsub("N/A","",clean_2[,i])
  clean_2[,i] <- as.numeric(clean_2[,i])
}
  
str(clean_2)

#8. Summary of data

summary(clean_2)

install.packages("moments")
library(moments)

for(i in 3:11) {
  hist(clean_2[,i], main = colnames(clean_2[,i]))
  #skew<- skewness(clean_2)
}
#skew

# Data is right skewed as mean>median for all columns

## PLOTS

# 1. Create plots for total cases, total death, and total recovery. 
#    Explain with a figure for each.

library(ggplot2)

cases<- clean_2 %>% select (3:5,12)
cases
str(cases)

# We can plot the cases against the continents for analysis

ggplot(cases) + geom_bar(aes(x= Continent, y=TotalCases), stat = "identity", na.rm = TRUE)
# We can see that Europe has the highest number of cases followed by North America and Asia

ggplot(cases) + geom_bar(aes(x= Continent, y=TotalDeaths), stat = "identity", na.rm = TRUE)
# We can see that Europe has the highest number of deaths followed by North America and 
# South America

ggplot(cases) + geom_bar(aes(x= Continent, y=TotalRecovered), stat = "identity", na.rm = TRUE)
# We can see that Asia has the highest number of recoveries followed by Europe and 
# North America.

# 2. Create a plot to examine the correlation between total cases and total population. 
#    Explain if there is any correlation between total cases and total population.

str(clean_2)
ggplot(clean_2, aes(x=Population, y=TotalCases)) +
  geom_point()  + 
  stat_smooth(method = "lm", col = "red", se = FALSE)

# We can see that there is very little correlation between Population and the Total Cases


# 3. Create a plot to examine the correlation between Tot Cases/1M pop and total population. 
#    Explain if there is any correlation between them?
ggplot(clean_2, aes(y=Population, x=CasesPerMillionPop)) +
  geom_point()  + 
  stat_smooth(method = "lm", col = "red", se = FALSE)

# It is visible that there is no correlation between the Cases per Million and the total 
# Population.


# 4. Which column do you feel is better for comparison purposes, total cases 
#    or TotCases/1M pop.Explain.

# As the Cases per Million seems to be unaffected by other parameters like Population,
# it might be better to use this for analysis.


# 5. Create a plot to examine the correlation between total cases and total death. 
#    Explain the figure.
ggplot(clean_2, aes(y=TotalDeaths, x=TotalCases)) +
  geom_point()  + 
  coord_fixed()+
  scale_x_log10()+
  scale_y_log10()+
  stat_smooth(method = "lm", col = "red", se = FALSE)

# There appears to be a strong correlation between the Total Cases and Total Deaths.
# Deaths are increasing as the cases are increasing.


# 6. Create a plot to examine the correlation between total cases and Deaths/1M pop. 
#    Explain the figure. Which column is more suitable to compare the result, 
#    total death or Death/1Mpop?
ggplot(clean_2, aes(y=DeathsPerMillionPop, x=TotalCases)) +
  geom_point()  + 
  coord_fixed()+
  scale_x_log10()+
  scale_y_log10()+
  stat_smooth(method = "lm", col = "red", se = FALSE)

# There is no visible correlation between the Total cases and the Deaths per Million.
# The Total Deaths seems to be a better value for comparison.


# 7. Compare Tot Cases/1M pop by continent, and explain your result. 
ggplot(clean_2, aes(x= Continent, y=CasesPerMillionPop, fill=Continent)) +
  geom_bar(position = "dodge", stat = "identity")

# We can see that Europe has the highest number of Cases per Million Population, while 
# South America has the least.


# 8. Compare Deaths/1M pop by continent, and explain your result. 
ggplot(clean_2, aes(x= Continent, y=DeathsPerMillionPop, fill=Continent)) +
  geom_bar(position = "dodge", stat = "identity")

# We can see that Europe has the highest number of Deaths per Million Population, while 
# Australia/Oceania has the least.


# 9. Which country is best among testing the COVID19 and which country is worst? 
# There are two columns total test vs. test/M. Choose appropriate column. 

clean_2$Country[which.max(clean_2$TotalTests)]

clean_2$Country[which.min(clean_2$TotalTests)]

# When total tests are considered, the best is USA and worst is Vanuatu

clean_2$Country[which.max(clean_2$TestsPerMillionPop)]

clean_2$Country[which.min(clean_2$TestsPerMillionPop)]

# When tests per million is considered, the best is Gibraltar and worst is Yemen

# In my opinion, we should consider tests per million as this in independent of 
# population of the country


# 10. Compare your COVID19 test results by continent? 
#     There are two columns total test vs test/M. Choose appropriate column.

ggplot(clean_2, aes(x= Continent, y=TotalTests, fill=Continent)) +
  geom_bar(position = "dodge", stat = "identity")

# North America has the most number of Total Tests and Africa has the least. 

ggplot(clean_2, aes(x= Continent, y=TestsPerMillionPop, fill=Continent)) +
  geom_bar(position = "dodge", stat = "identity")

# Europe has the most number of tests per million population and Africa has the least.

# In my opinion, we should consider the Tests per million as it is not affected by the
# population of the continent.


# 11. Check if Tests/1M pop is skewed or normally distributed.

summary(clean_2$TestsPerMillionPop)

# From the summary, we can see that the Mean > Median. This implies that the Test per
# Million is right skewed


