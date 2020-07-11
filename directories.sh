#!/bin/bash

for argument in $@;do
	
	if [ -d $argument ];then
		for file in `find $argument -type f`;do
			OWNER=`ls -l $file | awk '{print $3}' `
			if [ `cat users.txt | grep "$OWNER"`  ];then
				if [ `ls -l $file | awk '{print $1}' | grep "^.....w...." ` ];then
					DIMENSIUNE=`ls -l $file | awk '{print $5}' `
					echo "$file - $OWNER : $DIMENSIUNE"
				fi
			fi
		done
	elif [ -f $argument ];then
		OWNER=`ls -l $file | awk '{print $3}'`
		if [ `cat users.txt | grep "$OWNER" ` ] && [ `ls -l $argument | awk '{print $1}' | grep "^.....w...."` ];then
			DIMENSIUNE=`ls -l $argument | awk '{print $5}'`
			echo "$argument - $OWNER : $DIMENSIUNE"
		fi
	else
		echo "$argument Nu se proceseaza"
	fi
done
				
