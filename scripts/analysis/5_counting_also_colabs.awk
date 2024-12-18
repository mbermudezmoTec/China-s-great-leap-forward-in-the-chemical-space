#! /usr/bin/awk -f

BEGIN{
    OFS=FS="\t"
    print "\t"
    for(a=1981;a<=2022;a++){
	printf a"\t"
    }
    print "\t"
}

{
    year=$2
    a=""
    sub(":","",$3)
    pais=$3	
    if(match($3,":")){
	split($3,arr,":")
	n = asort(arr)
	for (i = 1; i <= n; i++){
	    a=a","arr[i]
	}
	sub(",","",a)
	colab[a,year]+=1
	copa[a]	
    }else{
	a=pais
	colab[a,year]+=1
	copa[a]	
    }    
}

END{q=asorti(copa,lol)
    for (s=1;s<=q;s++){
	printf lol[s]"\t"
	for(a=1981;a<=2022;a++){
	    printf colab[lol[s],a]"\t"
	}
	print "\t"
    }
}	
