#! /bin/awk -f

### This script selects organometalic substances disregarding salts. It uses as input organic.tsv from the first classification given by 1_classification_SUBS.awk

BEGIN{
    FS="\t"; 
}

{
    if(match($3,"*")){
	split($3,part,"*")
	for( i in part) {
	    if(match(part[i],/C[A-Z0-9]/) && match(part[i],"(Li|Be|Na|Mg|Al|K|Ca|Sc|Ti|V|Cr|Mn|Fe|Co|Ni|Cu|Zn|Ga|Rb|Sr|Y|Zr|Nb|Mo|Tc|Ru|Rh|Pd|Ag|Cd|In|Sn|Cs|Ba|La|Ce|Pr|Nd|Pm|Sm|Eu|Gd|Tb|Dy|Ho|Er|Tm|Yb|Lu|Hf|Ta|W|Re|Os|Ir|Pt|Au|Hg|Tl|Pb|Bi|Po|Ra|Ac|Th|Pa|U|Np|Pu|Am|Cm|Bk|Cf|Es|At|Fr|Fm|Md|No|Lr)")){# is organic?
		print $1"\t"$2"\t"$3
	    }
	}
    }else{
	if(match($3,"(Li|Be|Na|Mg|Al|K|Ca|Sc|Ti|V|Cr|Mn|Fe|Co|Ni|Cu|Zn|Ga|Rb|Sr|Y|Zr|Nb|Mo|Tc|Ru|Rh|Pd|Ag|Cd|In|Sn|Cs|Ba|La|Ce|Pr|Nd|Pm|Sm|Eu|Gd|Tb|Dy|Ho|Er|Tm|Yb|Lu|Hf|Ta|W|Re|Os|Ir|Pt|Au|Hg|Tl|Pb|Bi|Po|Ra|Ac|Th|Pa|U|Np|Pu|Am|Cm|Bk|Cf|Es|At|Fr|Fm|Md|No|Lr)")){
	    print $1"\t"$2"\t"$3}
    }
}
