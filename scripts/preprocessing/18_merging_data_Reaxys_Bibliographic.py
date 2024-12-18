#!/usr/bin/env python3
#merging trhought dois
import pandas as pd
import numpy as np

#File to fill
df=pd.read_csv('substances_file',sep='\t',dtype=str,header=None,names=('c1','c2','c3','c4','c5','c6','c7','c8','c9'),index_col=False)#, skiprows=1)

#File with the new information
df2=pd.read_csv('bibliographic_file',sep='\t',dtype=str,header=None,names=('c3','d2','d3','d4'))#,skiprows=1)
# c4             d2         d3    d4
#CNR    	#aut	CIT_AU	countries
#df2['c4']=df2['c4'].str.upper()

df3=df.merge(df2,how='left')
df3['c9'] = np.where(df3['c9'].isnull(), df3['d4'], df3['c9'])
df3['c8'] = np.where(df3['c8'].isnull(), df3['d2'], df3['c8'])
df3['c5'] = np.where(df3['d3'].notnull(), df3['d3'], df3['c5'])
df4=df3.drop(columns=['d2','d3','d4'])

#File merged
df4.to_csv('merged_file',index_label=True,index=False,header=False,sep="\t") 
