
# coding: utf-8

# In[4]:


def both_ends(word):
    if len(word)>1:
        return word[:2]+word[len(word)-2:len(word)]
    else:
        return ""
n=input("Enter a word: ")
both_ends(n)

