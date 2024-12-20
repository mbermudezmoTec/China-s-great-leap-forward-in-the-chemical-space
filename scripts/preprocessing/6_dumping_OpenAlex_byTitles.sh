#!/bin/bash
#Script to dump data from OpenAlex, searches are made by publication titles

for i in $(seq 1 80000);
do 
   a=$(sed -n $i'{p;q}' titles_to_search_OA_Hydra.tsv)
   echo $i
   wget https://api.openalex.org/works?filter=title.search:$a
   cat *works* >> outs1.txt
   rm *works*
done
