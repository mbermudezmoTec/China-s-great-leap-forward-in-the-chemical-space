#! /usr/bin/awk -f
#Script to assign the weighted contribution of each country to the chemical space

BEGIN{
    FS=OFS="\t"
    printf "\t"
    for(a=1981;a<=2022;a++){
	printf a"\t"
    }
    printf "\n"
}

{
    year=$2
    if (match($9,":")){
	n=split($9,arr,":")
	for(i in arr){	    
	    pais=arr[i]
	    yearCoun[pais]=year
	    conteo[pais,yearCoun[pais]]+=1/n
	    countries[pais]	    
	}
    }else{
	pais=$9
	sus[pais]=pais
	yearCoun[pais]=year
	conteo[pais,yearCoun[pais]]+=1
	countries[pais]
    }
}
END{
    for (i in countries){
	printf i "\t"
	for(a=1981;a<=2022;a++){
	    printf conteo[i,a]"\t"
	}
	printf "\n"
    }
}	
