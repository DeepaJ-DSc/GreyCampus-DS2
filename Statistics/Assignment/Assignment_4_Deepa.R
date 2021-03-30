#I. Data: The World Values Survey is an ongoing worldwide survey that polls the world 
# population about perceptions of life, work, family, politics, etc. The most recent phase 
# of the survey that polled 77,882 people from 57 countries estimates that 36.2% of the world's
# population agrees with the statement "Men should have more right to a job than women." The 
# survey also estimates that 13.8% of people have a university degree or higher and that 3.6% 
# of people fit both criteria.

# Solution:
# Let us assume:
# Event A= Agree with the statement "Men should have more right to a job than women"
# Event B= People with University degree or higher

# P(A)= 36.2%= 0.362
# P(B)= 13.8%= 0.138
# P(A and B)= 3.6%= 0.036


# 1. Are agreeing with the statement "Men should have more right to a job than women" and 
# having a university degree or higher disjoint events?

# For disjoint events, P(A and B)= 0. But in this case, this is not true.
# Hence, we can say that the two events A and B are not disjoint.


# 2. Draw a Venn diagram summarizing the variables and their associated probabilities.

# Solution:
library("VennDiagram")

prob_A <- 0.362
prob_B <- 0.138


prob_A_and_B <- 0.036

# Creating pairwise Venn diagram
draw.pairwise.venn(prob_A, prob_B, prob_A_and_B, fill = c("red", "yellow"),lty ="blank")


# 3. What is the probability that a randomly drawn person has a university degree or 
# higher or agrees with the statement about men having more right to a job than women?

# We know that for disjoint events, P(A or B)= P(A)+ P(B) - P(A and B)

prob_A_or_B <- prob_A + prob_B - prob_A_and_B
prob_A_or_B

# Ans: 0.464 = 46.4%


# 4. What percent of the world population do not have a university degree and disagree 
# with the statement about men having more right to a job than women?

# Not(P(A or B))= 1-P(A or B)

prob_not_A_or_B <- 1 - prob_A_or_B
prob_not_A_or_B

# Ans: 0.536 = 53.6%


# 5. Does it appear that the event that someone agrees with the statement is 
# independent of the event that they have a university degree or higher?

# For two events to be independent, the Product Rule should be true.
# That is: P(A and B) = P(A) * P(B)

prob_A_and_B
# 0.036= 3.6%

prob_A * prob_B
# 0.049956 = 4.9956%

# Ans: We can see that they are not equal. Hence, the events are not independent


# 6. What is the probability that at least 1 in 5 randomly selected people to 
# agree with the statement about men having more right to a job than women?

# Probability of not agreeing to the statement: 
# Not(P(A)) = 1-P(A)
# Probability of at least 1 in 5 agreeing= 1 - Probability of not agreeing ^ 5

prob_not_A = 1- prob_A 
prob_not_A

# 0.638

prob_5_agree = 1 - prob_not_A^5
prob_5_agree

# 0.8942931 = 89.42931%



# II. Data: As of 2009, Swaziland had the highest HIV prevalence in the world. 25.9% 
# of this country's population is infected with HIV. The ELISA test is one of the first 
# and most accurate tests for HIV. For those who carry HIV, the ELISA test is 99.7% 
# accurate. For those who do not carry HIV, the test is 92.6% accurate. If an individual 
# from Swaziland has tested positive, what is the probability that he carries HIV? Create
# a tree diagram to calculate the probability.

# Probability that person is infected with HIV = 25.9% = 0.259
# Probability that person is not infected with HIV = 100 - 25.9% = 74.1% = 0.741

# Probability of infected tests positive = 99.7% = 0.997
# Probability of infected tests negative = 1 - 0.997 = 0.003

# Probability of not infected tests negative = 92.6% = 0.926
# Probability of not infected tests positive = 1 - 0.926 = 0.074


# Population ---- (0.259) HIV Positive  ----- (0.997) Tests Positive -- 0.997*0.259=0.258223
#            |                          |
#            |                          |____ (0.003) Tests Negative -- 0.003*0.259=0.000777
#            |
#            |___ (0.741) HIV Negative  ----- (0.074) Tests Positive -- 0.074*0.741=0.054834
#                                      |
#                                      |_____ (0.926) Tests Negative -- 0.926*0.741=0.686166

# 1. If an individual from Swaziland has tested positive, what is the probability that
# he carries HIV?

# Probability(HIV Positive given Tests Positive)= Probability(HIV Positive and Tests Positive)/Probability(Test Positive)
#  Probability(HIV Positive given Tests Positive) = 0.258223/ (0.258223+0.054834)
#                                                 = 0.258223/ 0.313057= 0.824843
# Ans: 0.824843 = 82.4843%


# 2. According to a 2013 Gallup poll, worldwide only 13% of employees are engaged at work 
# (psychologically committed to their jobs and likely to be making positive contributions
# to their organizations). Among a random sample of 10 employees, what is the probability
# that 8 of them are engaged at work? 

# Here, we have a binomial distribution where the probability of employees engaged at work
# is 13% (0.13)
# Probability of 8 out of 10 engaged in work is:
dbinom(8,10,0.13)

# Ans: 2.77842e-06

# 3. Recent study: "Facebook users get more than they give"
# friend requests: 40% made, 63% received at least one
# likes: liked 14 times, had their content "liked" 20 times, on average
# messages: sent 9 messages, received 12, on average
# tags:12% tagged a friend in a photo, but 35% tagged other findings:
# 25% considered power users
# average Facebook user has 245 friends
# P(70 or more power user friends) = ?

# n = avg. no of friends = 245
# p = prob. of power users = 25% = 0.25
# This is a binomial distribution with success rate of 25%

# Probability(70 or more power user friends)= P(70)+P(71)+P(72)+.........+P(245)

sum(dbinom(70:245,245,0.25))

# Ans:  Probability(70 or more power user friends) =0.112763

#4. According to a 2014 Gallup poll, 56% of uninsured Americans who plan to get health 
# insurance say they will do so through a government health insurance exchange. What is 
# the probability that in a random sample of 10 people exactly 6 plan to get health 
# insurance through a government health insurance exchange?

#  Here, we have a binomial distribution where the probability of getting a government
# health insurance plan is 56% (0.56)
# Probability of 6 out of 10 getting government health insurance is:
dbinom(6,size = 10,prob=0.56)

# Ans: 0.2427494


