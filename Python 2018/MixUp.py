
# coding: utf-8

# In[6]:


def mixUp(a, b):
    return b[:2]+a[2:]+" "+a[:2]+b[2:]
n=input("Enter a word: ")
m=input("Enter another word: ")
mixUp(n,m)

