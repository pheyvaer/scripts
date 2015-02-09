#! /bin/bash

DEVFOLDER='/your/dev/folder'
declare -a REPOS=($DEVFOLDER'repo-1' $DEVFOLDER'repo-2');

if [[ $# == 1 ]]
then
	if [[ "$1" == "-v" ]]
	then
		VERBOSE=true
	elif [[ "$1" == "--verbose" ]]
	then
		VERBOSE=true
	else
		echo -e "\e[31mInvalid argument\e[0m"
		exit 1
	fi
else
	VERBOSE=false
fi

for i in "${REPOS[@]}"
do
	cd $i
	if ! git status &> /dev/null
	then
		echo "git repo not found $i"
	fi

	RESULT=`git status`

	if [[ $RESULT == *"nothing to commit"* ]]
	then
			if $VERBOSE
			then
				echo "Nothing to commit for '"$i"'"
			fi
	else
			echo -e "\e[33mSomething to commit for '"$i"'\e[0m"
	fi
done
