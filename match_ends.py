
# coding: utf-8

# In[35]:


def match_ends(list):
    x=0;
    for word in list:
        if len(word)>=2:
            if word[0]==word[-1]:
                x+=1;
    print(x);        


# In[31]:


match_ends(["apple","ant", "ana"])


# In[32]:


match_ends(["aaa","aab","abc","bbb"])


# match_ends(["aaa","aab","abc","bbb"])

# In[36]:


match_ends(["aba","xyz","aa","bbb","x"])

