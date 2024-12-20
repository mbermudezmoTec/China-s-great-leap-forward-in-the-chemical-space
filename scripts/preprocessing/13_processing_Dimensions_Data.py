#!/usr/bin/env python3
#This script processes raw data dumped from Dimensions and returns author names and their affiliations for authors of papers reporting substances in Reaxys.

import json
import ast

with open('cuncho_dois_Dimensions_2.tsv') as file:
    for line in file:    
        json_data = ast.literal_eval(str(line))                
        if 'publications' in json_data: #publications is a list of a single element
            if(len(json_data['publications'])>0 and 'publications' in json_data):
                a=json_data['publications'][0]    
                if('doi' in a):
                    print(a['doi'],end="\t")
                    if 'authors' in a:# 'authors' is a list, where each authors has a dictionary: dict_keys(['affiliations', 'corresponding', 'current_organization_id', 'first_name', 'last_name', 'orcid', 'raw_affiliation', 'researcher_id'])
                        print(len(a['authors']),end='\t')
                        for i in range(len(a['authors'])):
                            print(a['authors'][i]['first_name']+" "+a['authors'][i]['last_name'],end=':')
                        print(end='\t')
                        for i in range(len(a['authors'])):
                            if len(a['authors'][i]['affiliations'])>0:
                                print(a['authors'][i]['affiliations'][0]['country_code'],end=':')#'affiliations' is a list, for there are authors with more than one affiliation. We only take the first affiliation.
                        print(end='\n')
                    else:
                        print('\t\t',end='\n')
                else:
                    print(end='\n')        
