#!/bin/bash -x
#singlet variable
coutHeadWin=0
countTailsWin=0

#doublet variable
headHead=0
headTail=0
tailHead=0
tailHead=0

#thriplet variable
hHH=0
hHT=0
hTH=0
tHH=0
hTT=0
tHT=0
tTH=0
tTT=0

declare -A singlet
declare -A doublet
declare -A thriplet

function percentageSinglet(){
	percentageHead=$(( (${singlet[H]}/20)*100 ))
	echo "H-" $percentageHead
	percentagetails=$(( (${singlet[T]}/20)*100 ))
	echo "T-" $percentagetails

}

function percentageDoublet(){
        percentageHH=$(( (${doublet[HH]}/20)*100 ))
        echo "HH-" $percentageHH

        percentageHT=$(( (${doublet[HT]}/20)*100 ))
        echo "HT-" $percentageHT

	percentageTT=$(( (${doublet[TT]}/20)*100 ))
        echo "TT-" $percentageHT

	percentageTH=$(( (${doublet[TH]}/20)*100 ))
        echo "TH-" $percentageTH

}

function percentageThriplet(){
	percentagehHH=$(( (${thriplet[HHH]}/20)*100 ))
	echo "HHH" $percentagehHH

	 percentagehHT=$(( (${thriplet[HHT]}/20)*100 ))
        echo "HHT" $percentagehHT

	 percentagehTH=$(( (${thriplet[HTH]}/20)*100 ))
        echo "HTH" $percentagehTH

	 percentagetHH=$(( (${thriplet[THH]}/20)*100 ))
        echo "THH" $percentagetHH

	 percentagehTT=$(( (${thriplet[HTT]}/20)*100 ))
        echo "HTT" $percentagehTT

	 percentagetHT=$(( (${thriplet[THT]}/20)*100 ))
        echo "THT" $percentageThT

	 percentagetTH=$(( (${thriplet[TTH]}/20)*100 ))
        echo "TTH" $percentagetTH

	 percentagetTT=$(( (${thriplet[TTT]}/20)*100 ))
        echo "TTT" $percentagetTT

}



for (( i=1; i<=20; i++ ))
do
	flip=$((RANDOM%2))
	if (( $flip==1 ))
	then
		echo "head won"
		((coutHeadWin++))
		 singlet[H]=$coutHeadWin
	else
		echo "tails won"
		((countTailsWin++))
		singlet[T]=$countTailsWin
	fi
done

for (( i=1; i<=20; i++ ))
do
        flip1=$((RANDOM%2))
	flip2=$((RANDOM%2))
        if (( $flip1==1 && $flip2==1 ))
        then
                echo "HH"
                ((headHead++))
                doublet[HH]=$headHead
        elif (( $flip1==1 && $flip2==0 ))
	then
                echo "HT"
                ((headTail++))
                doublet[HT]=$headTail
	 elif (( $flip1==0 && $flip2==0 ))
	 then
                echo "TT"
                ((tailTail++))
                doublet[TT]=$tailTail
	elif (( $flip1==0 && $flip2==1 ))
         then
                echo "TH"
                ((tailHead++))
                doublet[TH]=$tailHead
	else
		echo "error"

        fi
done


for (( i=1; i<=20; i++ ))
do
        flip1=$((RANDOM%2))
        flip2=$((RANDOM%2))
	flip3=$((RANDOM%2))
        if (( $flip1==1 && $flip2==1 && $flip3==1 ))
        then
                echo "HHH"
                ((hHH++))
                thriplet[HHH]=$hHH
        elif (( $flip1==1 && $flip2==1 && $flip3==0 ))
        then
                echo "HHT"
                ((hHT++))
                thriplet[HHT]=$hHT
	elif (( $flip1==1 && $flip2==0 && $flip3==1 ))
        then
                echo "HTH"
                ((hTH++))
                thriplet[HTH]=$hHT
	 elif (( $flip1==0 && $flip2==1 && $flip3==1 ))
        then
                echo "THH"
                ((tHH++))
                thriplet[THH]=$tHH
	 elif (( $flip1==1 && $flip2==0 && $flip3==0 ))
        then
                echo "HTT"
                ((hTT++))
                thriplet[HTT]=$hTT
	 elif (( $flip1==0 && $flip2==1 && $flip3==0 ))
        then
                echo "THT"
                ((tHT++))
                thriplet[THT]=$tHT
	 elif (( $flip1==0 && $flip2==0 && $flip3==1 ))
        then
                echo "TTH"
                ((tTH++))
                thriplet[TTH]=$tHT
	 elif (( $flip1==0 && $flip2==0 && $flip3==0 ))
        then
                echo "TTT"
                ((tTT++))
                thriplet[TTT]=$tTT
	else
		echo "wrong combination"

	fi
done

echo "[ ${singlet[@]} ]"
echo "[ ${!singlet[@]} ]"
echo "[ ${doublet[@]} ]"
echo "[ ${!doublet[@]} ]"
echo "[ ${thriplet[@]} ]"
echo "[ ${!thriplet[@]} ]"

percentageSinglet
percentageDoublet
percentageThriplet
