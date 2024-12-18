#! /bin/awk -f

#this script was created to the Pandemic project
#this script gives the list of substances reported in the substances context with the first year on journals toghether with the cnr number
### This script finds the first date of apparition of every substances reported in the substaces context.
# This information comes from hydra/bermudez/PREP/P_SUB/scr_01_Aug_23/heads_unique_all_subds.tsv

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

