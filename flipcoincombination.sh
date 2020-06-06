#!/bin/bash -x

declare -A dict

#for ((i=1;i<=10;i++))
#do
#	dict[$i]=0
#done

h=0
t=0

for ((i=1;i<=10;i++))
do
 		coin=$[($RANDOM%2)]

		if (($coin == 1 ))
		then
			#echo "H"
			dict["H"]=$((++h))
		else
			#echo "T"
			dict["T"]=$((++t))
		fi
done

echo "singlet combination"
echo ${!dict[@]} "-" ${dict[@]}

echo "heads percentage="
echo "scale=3; $h/10*100" | bc
echo "tails percentage=" 
echo "scale=3;$t/10*100" | bc


hh=0
tt=0
ht=0
th=0

for ((i=1;i<=10;i++))
do
	coin1=$[(RANDOM%2)]
	coin2=$[(RANDOM%2)]

		if (($coin1 == 1 && $coin2 == 1))
		then
			dict["HH"]=$((++hh))
		elif (($coin1 == 1 && $coin2 == 0))
		then
			dict["HT"]=$((++ht))
		elif (($coin1 == 0 && $coin2 == 1))
		then
			dict["TH"]=$((++th))
		elif (($coin1 == 0 && $coin2 == 0))
		then
			dict["TT"]=$((++tt))
		fi

done

echo "doublet combination"
echo ${!dict[@]} "-" ${dict[@]}

hhh=0
hht=0
hth=0
htt=0
thh=0
tht=0
tth=0
ttt=0

for ((i=1;i<=10;i++))
do
	c1=$[(RANDOM%2)]
	c2=$[(RANDOM%2)]
	c3=$[(RANDOM%2)]

    if (( $c1 == 1 && $c2 == 1 && $c3 == 1 ))
	then
		dict["HHH"]=$((++hhh))
	elif (( $c1 == 1 && $c2 == 1 && $c3 == 0 ))
	then
		dict["HHT"]=$((++hht))
	elif (( $c1 == 1 &&  $c2 == 0 &&  $c3 == 1 ))
	then
		dict["HTH"]=$((++hth))
	elif (( $c1 == 1 &&  $c2 == 0 &&  $c3 == 0 ))
	then
		dict["HTT"]=$((++htt))
	elif (( $c1 == 0 &&  $c2 == 1 &&  $c3 == 1 ))
	then
		dict["THH"]=$((++thh))
	elif (( $c1 == 0 &&  $c2 == 1 &&  $c3 == 0 ))
	then
		dict["THT"]=$((++tht))
	elif (( $c1 == 0 &&  $c2 == 0 &&  $c3 == 1))
	then
		dict["TTH"]=$((++tth))
	elif (( $c1 == 0 &&  $c2 == 0 &&  $c3 == 0 ))
	then
		dict["TTT"]=$((++ttt))
	fi

done

echo "Triplet combination"
echo ${!dict[@]} "-" ${dict[@]} | awk 'BEGIN{RS=" ";} {print $1}' | sort 
