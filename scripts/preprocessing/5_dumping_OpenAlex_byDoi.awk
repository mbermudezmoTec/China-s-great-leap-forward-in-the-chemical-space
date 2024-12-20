#!/bin/bash
#Script to dump data from OpenAlex, searches are made by DOI

for i in $(seq 1 20000);
do echo $i 
   a=$(sed -n $i'{p;q}' dois_list_file )
   wget "https://api.openalex.org/works/https://doi.org/$a"
   b=$(echo $a | awk 'BEGIN{FS="\/"} {print $2}')
   cat $b >> output_file
   rm $b
done
