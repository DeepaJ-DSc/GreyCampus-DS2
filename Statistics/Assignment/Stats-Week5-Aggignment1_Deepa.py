#!/usr/bin/env python
# coding: utf-8

# ### Identify whether students from different sections have different scoring abilities using Z - Test

# In[1]:


import pandas as pd
import numpy as np
stud_df = pd.read_excel('F:/GreyCampus-Datascience/DS5/Statistics/Statistics+W2+Assignment+1.xlsx')
stud_df


# In[10]:


secA_mean = stud_df['Section A'].mean()
secA_mean


# In[9]:


secB_mean = stud_df['Section B'].mean()
secB_mean


# #### Perform a z-test to compare the scoring abilities of the students of both sections: 
# 
# Let us assume that the students of both sections have the same scoring ability.
# 
# Null Hypothesis: Students of different sections have the same scoring ability (Difference of means of both sections is 0)
# 
# Alternate Hypothesis: Students of different sections have different scoring abilities (Difference of means of both sections is not 0)

# In[17]:


from scipy import stats
from statsmodels.stats import weightstats as stests

ztest ,pval = stests.ztest(stud_df['Section A'], x2=stud_df['Section B'], value=(0),alternative='two-sided')
print("Pval: ", float(pval))
if pval<0.05:
    print("Students of different sections have different scoring abilities.")
else:
    print("Students of different sections have the same scoring ability.")

