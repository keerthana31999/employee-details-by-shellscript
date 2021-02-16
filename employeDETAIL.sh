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
for (( i=1; i<=20; i++ ))
do
	flip=$((RANDOM%2))
	if (( $flip==1 ))
	then
		echo "head won"
		((countHeadWin++))
		singlet[H]=$countHeadWin
	else
		echo "tails won"
		((countTailsWin++))
		singlet[T]=$countTailsWin
	fi
done
echo "head win count out of 20 is=" $countHeadWin
echo "tails win count out of 20 is=" $countTailsWin
echo "[ ${singlet[@]} ]"
percentagesinglet
