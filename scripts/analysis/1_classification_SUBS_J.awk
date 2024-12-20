#! /bin/awk -f

### This script classifies substances into: 1.Organic, substances with C. 2. rare earths. 
function min(arr){
    if(arr[1]!=""){
	m=arr[1]
	for(i in arr){
	    if(arr[i]<m) m=arr[i]
	}
	return m
    }
    else return 2030
}

BEGIN{
    FS="\t"; 
    OFS="\t";
    print "RXN.ID" "\t" "year" "\t" "Substance" "\t" "Organic" "\t" "Rare"
}

 NR>1{
    split($18,py,":")#column CIT.PY publication year on journals
    mpy=min(py)
    gsub("<*.sub>","",$2)
    organic=""
    if(match($2,/C[A-Z0-9[:space:]]/) || $2=="C"){
	organic=$2
    }
    raras=""
    if(match($2,"(Sc|Y|La|Ce|Pr|Nd|Pm|Sm|Eu|Gd|Tb|Dy|Ho|Er|Tm|Yb|Lu)")){
	raras=$2}
    print $1 "\t" mpy "\t" $2 "\t" organic "\t" rare
}


 
	
