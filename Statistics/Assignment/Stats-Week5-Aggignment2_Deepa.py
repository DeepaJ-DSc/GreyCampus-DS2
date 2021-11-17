#!/usr/bin/env python
# coding: utf-8

# ### Identify whether students have different scoring abilities in different subjects using T-Test (Paired two Sample Means)

# In[1]:


import pandas as pd
import numpy as np
stud_df = pd.read_excel('F:/GreyCampus-Datascience/DS5/Statistics/Statistics+W2+Assignment+2+dataset.xlsx')
stud_df


# In[2]:


Phy_mean = stud_df['Physics'].mean()
Phy_mean


# In[3]:


Chem_mean = stud_df['Chemistry'].mean()
Chem_mean


# #### Perform a Paired t-test to compare the scoring abilities of the students in different subjects:
# 
# Let us assume that the students have the same scoring ability in differnt subjects.
# 
# Null Hypothesis: Students have the same scoring ability in different subjects (Difference of means of both subjects is 0)
# 
# Alternate Hypothesis: Students have different scoring abilities in different subjects (Difference of means of both subjects is not 0)

# In[6]:


from scipy import stats

ttest,pval= stats.ttest_rel(stud_df['Physics'], stud_df['Chemistry'])


# #### Check if the Pvalue > 0.05, accept the null hypothesis, else reject the null hypothesis.

# In[7]:


print("Pval: ", float(pval))
if pval<0.05:
    print("Students have different scoring abilities in different subjects.")
else:
    print("Students have the same scoring ability in different subjects.")

