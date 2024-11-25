#/bin/bash
# This file is for saving to github from codespaces

#echo "Do you need to rabase? [y/n]"
#read message

#if [ $message = "y" ] || [ $message = "Y" ]

git add .
git commit -m "Remote from codespaces"
git push origin main
sleep 0.3
clear

sleep 0.3
echo "Saved."
sleep 1.3

clear