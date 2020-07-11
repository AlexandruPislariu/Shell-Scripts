#!/bin/bash

ARG=$@
DIRECTOR=$1

for argument in $ARG;do
	if [ -d $argument ];then
		DIRECTOR=$argument
		echo "$DIRECTOR will be processed"
	else
		for file in `find $DIRECTOR -type f`;do
			if [ `cat $file | grep "$argument"` ];then
				rm $file
			fi
		done
	fi
done                                                                                                                                 

for file in `find $DIRECTOR -type f`;do
	echo $file
done
