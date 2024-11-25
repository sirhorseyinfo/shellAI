#/bin/bash

# This file is for saving to github from codespaces

git add .
git commit -m "Remote from codespaces"
git push origin main
clear

sleep 0.3
echo "Saved."
sleep 1

clear