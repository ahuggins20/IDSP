
# coding: utf-8

# In[84]:


def front_x(list):
    list.sort();
    tmp=[];
    for word in list:
        if ord(word[0])==88 or ord(word[0])==120:
            tmp.append(word);
    tmp.sort();
    for x in range(0,len(tmp)):
        list.remove(tmp[x]);
        list.insert(x,tmp[x]);
    print(list);    


# In[87]:


front_x(['mix','xyz','apple','xanadu','aardvark'])

