#!/usr/bin/env python
# coding: utf-8

# In[7]:


from bs4 import BeautifulSoup
import requests


# In[8]:


url ='https://con.2merkato.com/prices/cat/12'


# In[10]:


page=requests.get(url)


# In[12]:


soup=BeautifulSoup(page.text,'html')


# In[13]:


print(soup)


# In[14]:


print(soup.prettify())


# In[21]:


soup.find('a')


# In[19]:


soup.find_all('div',class_ ='d-flex')


# In[57]:


soup.find('table',class_='table table-sm table-hover mt-3')


# In[69]:


table=soup.find_all('table')


# In[70]:


print(table)


# In[75]:


world_titles=soup.find_all('th')


# In[76]:


world_titles


# In[114]:


world_table_titles =[title.text for title in world_titles][4:]
print(world_table_titles)


# In[115]:


import pandas as pd


# In[116]:


df = pd.DataFrame(columns = world_table_titles)
df


# In[117]:


soup.find_all('tr')


# In[121]:


column_data=soup.find_all('tr')


# In[124]:


for row in column_data[2:]:
    row_data = row.find_all('td')
    individual_row_data = [data.text.strip() for data in row_data]
 
    length =len(df)
    df.loc[length] = individual_row_data
    
   


# In[125]:


df


# In[127]:


df.to_csv(r'C:\Users\AKE\Desktop\HC\constructionmaterialprice.csv')


# In[ ]:




