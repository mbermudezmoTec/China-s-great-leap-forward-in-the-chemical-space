#!/usr/bin/env python3

import json
import ast

with open('cuncho_dois_Dimensions_2.tsv') as file:
#with open('t1') as file:
    for line in file:    
        json_data = ast.literal_eval(str(line))                
        if 'publications' in json_data: #publications es una lista de un unico elemento
            if(len(json_data['publications'])>0 and 'publications' in json_data):
                a=json_data['publications'][0]    
                if('doi' in a):
                    print(a['doi'],end="\t")
                    if 'authors' in a:# 'authors' es una lista donde cada autor tiene un diccionario: dict_keys(['affiliations', 'corresponding', 'current_organization_id', 'first_name', 'last_name', 'orcid', 'raw_affiliation', 'researcher_id'])
                        print(len(a['authors']),end='\t')
                        for i in range(len(a['authors'])):
                            print(a['authors'][i]['first_name']+" "+a['authors'][i]['last_name'],end=':')
                        print(end='\t')
                        for i in range(len(a['authors'])):
                            if len(a['authors'][i]['affiliations'])>0:
                                print(a['authors'][i]['affiliations'][0]['country_code'],end=':')#'affiliations' es una lista porque hay autores que tienen mas de una adscripcion. Se va a tomar UNICAMENTE LA PRIMERA ADSCRIPCION
                        print(end='\n')
                    else:
                        print('\t\t',end='\n')
                else:
                    print(end='\n')
                    
                        
