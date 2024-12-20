#! /usr/bin/awk -f
# For each subsgtance, Reaxys substance identification, molecular formula and first publication year are retrieved from Reaxys
# This script is based on a previous script by Andres Camilo Marulanda Bran (July 14 2022).
# #
BEGIN {
    a="IDE.XRN,IDE.MF,CIT.PY,CNR.CNR"
    split(a,rxdets,",")
    gsub(",","\t",a)
    print a
}

{regx="<.*\\..*>.*<\\/.*\\..*>"
    if (match($0,regex) && !match($0,"response")) { 
	pattern=gensub(/.*<\/(.*?)>.*/,"\\1","g",$0)#Detects fields
	if(match(a,pattern)){
    		if(pattern==rxdets[1]){
		    rgx=".*<"pattern".*>(.+)</"pattern">"#If the field belongs to the list, it is stored
		    data[pattern]=data[pattern] ":" gensub(rgx,"\\1","g",$0)
	    }
		if(pattern!=rxdets[1]){
		    rgx=".*<"pattern">(.+)</"pattern">"#If the field belongs to the list, it is stored
		    data[pattern]=data[pattern] ":" gensub(rgx,"\\1","g",$0)
	    }

	}
    }
    if(match($0,"</substance>")){ # Needed to store information per substnace and not in a cumulative fashion
    	line=""
	for(i in rxdets){
		field=rxdets[i]
		sub(":","",data[field]) # Remove first ":"
		line=line "\t" data[field]		
	    }
	sub("\t","",line)#Remove the first "\t"
      	print line
	delete data # The list have been cleaned
    }
}



