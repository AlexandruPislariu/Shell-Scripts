#!/bin/bash

>romania.txt
>altele.txt

ARG=$@

for argument in $@;do
	if [ -f $argument ];then
		echo "$argument will be processed"
		cat $argument | awk -F- '{print $2}' | grep "^ +4[0-9]\{12\}$" >> romania.txt
		cat $argument | awk -F- '{print $2}' | grep "^ +[^4][0-9]\{12\}$" >> altele.txt
	else
		echo "$argument is not a file"
	fi
done

echo "Numere romanesti: " 
cat romania.txt | wc -l 
echo "Numere straine: "
cat altele.txt | wc -l 
