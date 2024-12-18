#!/bin/bash

for i in $(seq 1 130000);

do echo $i 
   a=$(sed -n $i'{p;q}' file.txt )
   wget $a
   cat work* >> out_try_2.txt
   rm work*
done
