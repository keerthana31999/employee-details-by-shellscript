#!/bin/bash -x
coutHeadWin=0
countTailsWin=0
declare -A singlet
function percentagesinglet(){
	percentageHead=$(( (${singlet[H]}/20)*100 ))
	echo "H-" $percentageHead
	percentagetails=$(( (${singlet[H]}/20)*100 ))
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

echo "[ ${singlet[@]} ]"
echo "[ ${!singlet[@]} ]"
echo "[ ${doublet[@]} ]"
echo "[ ${!doublet[@]} ]"

percentageSinglet
percentageDoublet
