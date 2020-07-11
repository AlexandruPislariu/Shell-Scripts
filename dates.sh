#!/bin/bash

>short.txt
>long.txt

for argument in $@;do

	if [ -f $argument ];then
		echo "$argument will be processed "
		cat $argument | awk -F- '{print $2}' | grep "^ [0-9]\{2\}\.[0-9]\{2\}\.[0-9]\{4\}$" | sed "s/\([0-9]\)\([0-9]\)\./\2\1\./gi" >> short.txt
		cat $argument | awk -F- '{print $2}' | grep "^ [0-9]\{2\} [A-Z]\{1\}[a-z]\{2\} [0-9]\{4\}" >>long.txt 
	else
		echo "$argument does not exist"
	fi
done
cat short.txt | sort | uniq -c 
cat long.txt | sort  | uniq -c 
