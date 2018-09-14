
# coding: utf-8

# In[6]:


def donuts(x):
    if int(x)<10:
        return "Number of donuts: "+x
    else:
        return "Number of donuts: many"
n=input("How many donuts?: ")
donuts(n)

