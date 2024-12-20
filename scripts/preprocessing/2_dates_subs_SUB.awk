#! /bin/awk -f

#This script gives the list of substances reported in the substances context of Reaxys with the first publication year (in journals) toghether with the cnr number and the molecualr formula

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
#    print "IDE.XRN" "\t"  "IDE.MF" "\t" "minJorunal"
}

{
    if($130!=""){
	split($130,py,":")#column CIT.PY publication year on journals
	split($129,cnr,":")#column CNR.CNR
	miny=py[1]
	jour=cnr[1]
	for(y in py){	# each substance in reaction role $is[i]
	    if(py[y]<miny){
		miny=py[y]
		jour=cnr[y]
	    }
	}
	print $1"\t"miny"\t"jour
    }
}

