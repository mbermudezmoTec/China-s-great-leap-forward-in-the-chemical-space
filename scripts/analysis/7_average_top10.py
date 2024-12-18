#!/usr/bin/env python3
# no se hizo, las organicas ya estan analizadas asi
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from warnings import simplefilter
simplefilter(action="ignore", category=pd.errors.PerformanceWarning)

#data counting of compositions by year
df1=pd.read_csv('t1',sep='\t')#,index_col=0)
#deleting empty colummns
df1= df1.loc[:, ~df1.columns.str.contains('^Unnamed')]
#selecting years DROP THE CORRECT NUMBER OF COLUMMS TO THE NEW DATA

#data total number of substances by year
dfto=pd.read_csv('t2',sep='\t')#,index_col=0)
dfto=dfto.loc[:, ~dfto.columns.str.contains('^Unnamed')]
cols = range(1,16)
dfto.drop(dfto.columns[cols],axis=1,inplace=True)

#adding the total number of substances by year
newpf=pd.concat([df1,dfto])
#transponing data
de1=newpf.set_index('compo').T
#deleting empty columns
de=de1.dropna(axis=1, how='all')

new_df = pd.DataFrame([])

# getting the percentage by year
num=len(de.columns)-2
#print(de)

for i in range(0,num):
    #print(i)
    new_df[de.columns[i]] = de[de.columns[i]]/de['total']*100

# list1 contains the weight contribution of each composition by year
list1=new_df.T
#list2 has the top 50 composiotons by year
list2 = pd.DataFrame([], columns = list1.columns)

list3 = pd.DataFrame([])#, columns = list1.columns)
for i in range(0,27):
    list2=pd.concat([list2,list1.sort_values([list1.columns[i]],ascending = False)])    
    list3[list1.columns[i]]=list1[list1.columns[i]].sort_values(ascending = False).index

list2 = list2[~list2.index.duplicated(keep='first')]
list2.to_csv('t3',sep='\t')
list3['i']=list3['1996']
list3=list3.set_index('i')
result = pd.DataFrame(index=list3.index, columns=list3.columns)

# Iterate over each column to find the position of the index in each row
for col in list3.columns:
    for idx in list3.index:
        result.loc[idx, col] = list3[col].tolist().index(idx) + 1

result['mean'] = result.mean(axis=1)
print(result.sort_values(by=['mean']).head(50))
result.sort_values(by=['mean']).head(5000).to_csv('t4',sep='\t')


