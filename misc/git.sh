#!/bin/sh

#print the status of the files
echo "$(tput setaf 6)_______________Git Status_______________"
git status
#add the files
echo "$(tput setaf 6)________________________________________"
echo "$(tput setaf 6)_______________Add Files_______________"
read filesAdded
git add $filesAdded
echo "$(tput setaf 6)________________________________________"
git status

echo "$(tput setaf 4)________________________________________"
echo "__________Give a commit message_________"
read commit_message
git commit -m "$commit_message"

echo "$(tput setaf 3)________________________________________"
git status
tput setaf 5
echo "Do you want to push y/n"
echo "________________________________________"
read push
if [ $push = "y" ]
then
	git push
	echo "$(tput setaf 2)-------Pushed--------$(tput sgr0)"
else
	echo "$(tput setaf 1)-------Not Pushed--------$(tput sgr0)"
fi


