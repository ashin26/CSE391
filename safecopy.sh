#!/bin/bash

if [ $# -ne 2 ]; then
	echo "usage: $0 from to"
	exit 1
fi

FROM=$1
TO=$2
if [ -e $TO ]; then
	read -p "Do you want to overwrite $TO (yes/no)?" ANSWER
	if [ $ANSWER = "YES" ]; then
		cp $FROM $TO
	fi

else
	cp $FROM $TO
fi
