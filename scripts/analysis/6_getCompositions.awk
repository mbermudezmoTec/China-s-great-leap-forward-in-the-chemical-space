#! /bin/awk -f

# Script to give composition and inchi to substances downloaded 2022 and preprocessing 12 Aug 23
BEGIN{
    FS="\t"
    elements="Ac,Ag,Al,Am,Ar,As,At,Au,B,Ba,Be,Bh,Bi,Bk,Br,C,Ca,Cd,Ce,Cf,Cl,Cm,Co,Cr,Cs,Cu,Ds,Db,Dy,Er,Es,Eu,F,Fe,Fm,Fr,Ga,Gd,Ge,H,He,Hf,Hg,Ho,Hs,I,In,Ir,K,Kr,La,Li,Lr,Lu,Md,Mg,Mn,Mo,Mt,N,Na,Nb,Nd,Ne,Ni,No,Np,O,Os,P,Pa,Pb,Pd,Pm,Po,Pr,Pt,Pu,Ra,Rb,Re,Rf,Rg,Rh,Rn,Ru,S,Sb,Sc,Se,Sg,Si,Sm,Sn,Sr,Ta,Tb,Tc,Te,Th,Ti,Tl,Tm,U,V,W,Xe,Y,Yb,Zn,Zr"
    split(elements,el,",")
}

{
    id=$1
#    mpy=$2
    delete compo
    gsub("[0-9]","",$3)
    gsub("*","",$3)
    gsub(/\(x\)/,"",$3)    
    for (i in el){
	if(match($3,el[i]"$")||match($3,el[i]"[A-Z<]")){
	    compo[id]=compo[id]","el[i]
	}
    }
    gsub(/,/,"",compo[id])#drop ,'s
    print $1 "\t" $2 "\t"  compo[id]
}
