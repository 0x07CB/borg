#!/bin/bash
if [ $# -eq 0 ]
then
	echo -e "\n"
	echo -e "Help: \n"
	echo -e "Usage:"
	echo -e "\t$0 <>"
	exit 1
else
	if [ "$1" == "-i" ]  || [ "$1" == "--init" ]; then
		
	elif [ "$1" == "-s"  ] || [ "$1" ==  "--switch" ]; then

	else
		main $1
	fi
fi
