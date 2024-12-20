#!/bin/bash
#Script to dump data from OpenAlex.  Searches are made by authors, titles, pages, years and ISSN.

for i in $(seq 1 130000);

do echo $i 
   a=$(sed -n $i'{p;q}' file.txt ) #file.txt was created by 7_creating_prompt_ISSN.py
   wget $a
   cat work* >> out_try_2.txt
   rm work*
done
