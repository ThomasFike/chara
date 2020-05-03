#!/usr/bin/env bash

echo "Warning this will replace your .bashrc and .bash_alias files"
read -p "Are you sure you want to continue? " -n 1 -r
echo    ""
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "Moving Files"
	cp .bashrc .bash_aliases ~/
	echo "Setting Sources"
	source ~/.bashrc
	echo "Complete"
fi
