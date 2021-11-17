#!/usr/bin/env python
# coding: utf-8

# #### 1. Vector multiplication using linear algebra approach

# In[2]:


import numpy as np
x = np.array([1,2,3])
print("x = ", x)
y = np.array([4,5,6])
print("y = ", y)

b=x.dot(y)
print("Product = ",b)


# #### 2. Matrix multiplication using linear algebra approach

# In[8]:


a= np.arange(10,22).reshape((3, 4))
print("a = ", a)

b= np.arange(1,29).reshape((4, 7))
print("\n b = ", b)

prod= a.dot(b)
print("\n product = ",prod)


# #### 3. Explain step by step process of cluster sampling and stratified sampling with proper assumptions.
# 
# In Stratified random sampling, we divide the entire target population into groups (more formally called "strata"). Now, a sample  is drawn from each strata (using a random sampling method like simple random sampling or systematic sampling).
# 
# Assumptions Of Stratified Sampling: Stratification is the process of dividing members of the population into homogeneous subgroups before sampling. The strata should define a partition of the population. That is, it should be collectively exhaustive and mutually exclusive: every element in the population must be assigned to one and only one stratum.
# 
# In Cluster sampling, you have natural groups separating the population called "Clusters". Now, some of the clusters are randomly chosen and all the samples in these clusters are considered as the sample. 
# 
# Assumptions of Cluster Sampling: The population within a cluster should ideally be as heterogeneous as possible, but there should be homogeneity between clusters. Each cluster should be a representation of the total population. The clusters should be mutually exclusive and collectively exhaustive.

# #### 4. What is the difference between mutually exclusive, non-disjoint, and independent events?
# 
# MUTUALLY EXCLUSIVE EVENTS: When two events do not occur simultaneously, then they are termed as Mutually exclusive events. The non-occurrence of an event will end up in the occurrence of the other event. They are also called as Disjoint events.
# P(A and B) = 0
# P(A or B) = P(A) + P(B)
# 
# INDEPENDENT EVENTS: An independent event is an event that occurs without being affected by other events. The happening of one event has nothing to do with the happening of the other and there is no cause-effect between the two. 
# 
# NON-DISCJOINT EVENTS: Non-disjoint events are events that can occur at the same time.
# P(A and B) ≠ 0
# P(A or B) = P(A) + P(B) - P(A and B)

# #### 5.What is probability density function and what is probability mass function?
# 
# Probability mass functions (PMF) is used to describe discrete probability distributions.It gives the probability that a discrete random variable is exactly equal to some value. Sometimes, it is also known as the discrete density function. 
# 
# Probability density functions (PDF) is used to describe continuous probability distributions. It is a statistical expression that defines a probability distribution (the likelihood of an outcome) for a discrete random variable.

# #### 6. Give examples of normal, binomial, and Poisson distribution?
# 
# NORMAL DISTRIBUTION: Normal/Gaussian Distribution is a bell-shaped graph. It is a symmetrical arrangement of a data set in which most values cluster in the mean and the rest taper off symmetrically towards either extreme. The mean of the distribution determines the location of the center of the graph, and the standard deviation determines the height and width of the graph. The total area under the normal curve is equal to 1.Height of the population is a very good example of normal distribution. Most of the people in a specific population are of average height. The number of people taller and shorter than the average height people is almost equal, and a very small number of people are either extremely tall or extremely short. Some other examples are rolling of a dice, tossing a coin, IQ of a population etc.
# 
# BINOMIAL DISTRIBUTION: The Binomial distribution is a probability distribution that is used to model the probability that a certain number of “successes” occur during a certain number of trials.For example, if you purchase a lottery ticket, you’re either going to win money, or you aren’t. Basically, anything you can think of that can only be a success or a failure can be represented by a binomial distribution. Some other examples are Number of Spam Emails per Day, Number of Fraudulent Credit card Transactions etc.
# 
# POISSON DISTRIBUTION: Poisson distribution is a probability distribution that can be used to show how many times an event is likely to occur within a specified period of time. It is a count distribution. It is used to understand independent events that occur at a constant rate within a given interval of time. It is used to estimate how likely it is that something will happen "X" number of times. Some examples are number of calls per Hour at a Call Center, Number of Arrivals at a Restaurant per Day, Number of Network Failures per Week etc.

# #### 7. What is hypothesis testing? What are different types of errors?
# 
# Hypothesis testing is used to test an assumption regarding a population parameter. It is used to assess the plausibility of a hypothesis by using sample data from a large population.
# 
# There are two types of Errors.
# 
# Type I error is the rejection of a true null hypothesis (also known as a "false positive"). For example, "an innocent person is convicted". This is the most dangerous type of error.
# 
# Type II error is the non-rejection of a false null hypothesis (also known as a "false negative"). For example: "a guilty person is not convicted".

# #### 8. What is the central limit theorem and what are the measure assumptions of CLT?
# 
# The Central Limit Theorem (CLT) states that the sample mean distribution of a random variable will assume a near-normal or normal distribution if the sample size is large enough. It states that the sampling distribution of the mean approaches a normal distribution as the size of the sample increases, regardless of the shape of the original population distribution.
# 
# The assumptions of CLT are:
# 
# 1. The data must follow the randomization condition. It must be sampled randomly.
# 2. Samples should be independent of each other. One sample should not influence the other samples.
# 3. Sample size should be not more than 10% of the population when sampling is done without replacement.
# 4. The sample size should be sufficiently large. When the population is skewed or asymmetric, the sample size should be large. If the population is symmetric, then we can draw small samples as well.

# #### 9. What is a T-test? What type of distribution it follows, please explain?
# 
# A T-test is used to determine if there is a significant difference between the means of two groups, which may be related in certain features. 
# 
# It is mostly used when the data sets, would follow a normal distribution and may have unknown variances. 
# 
# A T-test is used as a hypothesis testing tool, which allows testing of an assumption applicable to a population

# #### 10. What is ANOVA? What type of distribution it follows, please explain?
# 
# An ANOVA (Analysis of Variance) test is a way to find out if the experiment results are significant. It helps us to figure out if we need to reject the null hypothesis or accept the alternate hypothesis.
# 
# The ANOVA test to determine the influence that independent variables have on the dependent variable in a regression study.
# 
# The ANOVA test allows a comparison of more than two groups at the same time to determine whether a relationship exists between them. The result of the ANOVA formula, the F statistic (also called the F-ratio), allows for the analysis of multiple groups of data to determine the variability between samples and within samples.

# #### 11. How ANOVA differs from the T-test?
# 
# The T-test is a method that determines whether two populations are statistically different from each other, whereas ANOVA determines whether three or more populations are statistically different from each other.
# 
# The T-test is a hypothesis test that is used to compare the means of two populations is called. ANOVA is a statistical technique that is used to compare the means of more than two populations.
