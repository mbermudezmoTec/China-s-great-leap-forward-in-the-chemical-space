#!/usr/bin/env python3
#Script to dump data from Dimensions, searches are made by DOI

import dimcli
import pandas as pd
import json

# you can pass explicitly your login details as arguments
dimcli.login(key=" ", endpoint="https://app.dimensions.ai")

dsl = dimcli.Dsl()

reacrxns=pd.read_csv('buscarDi_si_queda_tiempo_Hydra.tsv',sep='\t',dtype=str,header=None)
p5=reacrxns.head()
lp5=p5[0].tolist()
col_one_list = reacrxns[0].tolist()

for i in col_one_list:
    doi1='doi="'+i+'"'
    res=dsl.query('search publications where \n' +doi1+' \n return publications[id+title+doi+year+authors+type+pages+journal+issue+volume]')
    with open('fileC2_1.txt', 'a') as file:
     file.write(json.dumps(res.data)+"\n") 
