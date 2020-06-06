#!/bin/bash -x

declare -A dictionary

counter=0
read a
read b
read c

dictionary["exp1"]=$[(a+b*c)]
dictionary["exp2"]=$[(a*b+c)]
dictionary["exp3"]=$[(c+a/b)]
dictionary["exp4"]=$[(a%b+c)]

#echo $exp1 $exp2 $exp3 $exp4
echo "orginal array" ${dictionary[@]}
echo "ascending"
echo  ${dictionary[@]} | awk 'BEGIN{RS=" ";} {print $1}' | sort -n
echo "descending" 
echo  ${dictionary[@]} | awk 'BEGIN{RS=" ";} {print $1}' | sort -nr
