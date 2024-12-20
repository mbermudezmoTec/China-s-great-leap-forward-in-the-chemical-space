#! /bin/awk -f

### This script classifies substances into: 1.Organic, substances with C. 2. Organometallic, substances with C, Fe Co, Ni, Ru, Rh, Pd, Pt. 3. rare earths. 
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
    print "RXN.ID" "\t" "year" "\t" "Substance" "\t" "Organic" "\t" "Inorganic" "\t" "platinumOrganic" "\t" "Alcaline" "\t" "Noble" "\t" "Rare" "\t" "Actinide"
}

 NR>1{
    split($18,py,":")#column CIT.PY publication year on journals
    mpy=min(py)
    gsub("<*.sub>","",$2)
    organic=""
    inOrganic=""
    if(match($2,/C[A-Z0-9[:space:]]/) || $2=="C"){
	organic=$2
    }else{
	inOrganic=$2}
    platinumMe=""
    if(match($2,"(Fe|Ni|Ru|Rh|Pd|Pt|Co|Os|Ir)")){
	platinumMe=$2}	    
    alcalines=""
    if(match($2,/Li|Na|K[^r]|Rb|Cs|Fr/)){
	alcalines=$2}        
    nobles=""
    if(match($2,"(He|Ne|Ar|Kr|Xe|Rn)")){
	nobles=$2}
    raras=""
    if(match($2,"(Sc|Y|La|Ce|Pr|Nd|Pm|Sm|Eu|Gd|Tb|Dy|Ho|Er|Tm|Yb|Lu)")){
	raras=$2}
    actinides=""
    if(match($2,"(Ac|Th|Pa|U|Np|Pu|Am|Cm|Bk|Cf|Es|Fm|Md|No|Lr)")){
	actinides=$2}
    print $1 "\t" mpy "\t" $2 "\t" organic "\t" inOrganic "\t" platinumMe "\t" alcalines "\t" nobles "\t" raras "\t" actinides
}


 
	
