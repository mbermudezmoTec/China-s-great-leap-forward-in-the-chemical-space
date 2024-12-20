#!/usr/bin/env python3
# This script merges the bibliographic information from the CIT context of Reaxys with the substances trouthgt CNR.CRN id
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

#Total substances
df1=pd.read_csv('cites_file',sep='\t',names=('c1','c2','c3','c4','c5','c6','c7','c8','c9','c10','c11','c12','c13','c14','c15','c16','c17','c18','c19','c20','c21','c22','c23','c24','c25','c26','c27','c28','c29','c30','c31','c32','c33','c34','c35','c36','c37'),dtype=str)
df2=pd.read_csv('subs_file',sep='\t',names=('r1','r2','c1'),dtype=str)
gty=df2.merge(df1)
gty.to_csv('merged_file',index_label=True,index=False,header=False,sep="\t")
