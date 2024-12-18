#!/usr/bin/env python3

import json

#with open('t1') as file:
with open('out_last_hope_percet.txt') as file:
    for line in file:        
        if line!='\n':
            js = json.loads(line)         
            print(js['doi'].split('org/')[1],end='\t')
            if not js['primary_location']['source'] is None:
                print(len(js['authorships']),end='\t')        
                for i in range(len(js['authorships'])):
                    print(js['authorships'][i]['raw_author_name'],end=':')
                print(end='\t')
                for i in range(len(js['authorships'])):
                    if len(js['authorships'][i]['countries'])==1:
                        print(js['authorships'][i]['countries'][0],end=':')                            
                print(end='\n')
            else:
                print('\t\t',end='\n')
