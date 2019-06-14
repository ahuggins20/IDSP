
# coding: utf-8

# In[4]:


def fix_start(word):
    return word[0]+word[1:].replace(word[0],"*")
n=input("Enter a word: ")
fix_start(n)

