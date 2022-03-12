#!/bin/bash
#
#
#
#
function BorgRepoName(){
	rm -rf /tmp/nameBorgRepo
	rm -rf /tmp/nameBorgRepoNum
	rm -rf /tmp/nameBorgRepoAndNum
	rm -rf /tmp/nameBorgRepoAndNum-ok
	echo "$(od -A n -t d -N 3 /dev/urandom)" | sha1sum >> /tmp/nameBorgRepo 
	echo "$(od -A n -t d -N 2 /dev/urandom)" >> /tmp/nameBorgRepoNum
	echo "$(cat /tmp/nameBorgRepo) $(cat /tmp/nameBorgRepoNum)" >> /tmp/nameBorgRepoAndNum
	echo "$(cat /tmp/nameBorgRepoAndNum)" | xargs >> /tmp/nameBorgRepoAndNum-ok
	if [ $# -eq 1 ]; then
		if [ "$1" == "1" ]; then
			cat /tmp/nameBorgRepoAndNum-ok
		elif [ "$1" == "0" ]; then
			echo "" > /dev/null
		else
			usageFuncBorgRepoName
		fi
	else 
		usageFuncBorgRepoName
	fi 
}

function usage(){
	echo -e "No args!\n"
	echo -e "Help: -n <verbose> |  --repo-name <verbose> (generate an reponame)\n"
	echo -e "Usage exemples:"
	echo -e "\t$0 -n 1 #Generate the repository name to out"
	exit 1
}

if [ $# -eq 0 ]
then
	usage()
else
	if [ "$1" == "-n" ]  || [ "$1" == "--repo-name" ]; then
		if [ $# -gt 1 ] && [ $# -lt 3 ]; then
			BorgRepoName $2
		else
			usage()
		fi
	#====================
	elif [ "$1" == "-s"  ] || [ "$1" ==  "--switch" ]; then
	fi
	#if [ "$1" == "-s"  ] || [ "$1" ==  "--switch" ]; then

	#fi
fi

