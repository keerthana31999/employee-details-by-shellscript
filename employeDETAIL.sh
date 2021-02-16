#!/bin/bash -x

coutHeadWin=0
countTailsWin=0
for (( i=1; i<=20; i++ ))
do
	flip=$((RANDOM%2))
	if (( $flip==1 ))
	then
		echo "head won"
		((countHeadWin++))
	else
		echo "tails won"
		((countTailsWin++))
	fi
done
echo "head win count out of 20 is=" $countHeadWin
echo "tails win count out of 20 is=" $countTailsWin
