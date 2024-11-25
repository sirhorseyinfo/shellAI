#/bin/bash
# This file is for saving to github from codespaces

runrebase() {
    git pull --rebase
    git add .
    git commit -m "Remote from codespaces"
    git push origin main
    sleep 0.3
    clear

    sleep 0.3
    echo "Saved."
    sleep 1.3
    clear
}

echo "Do you need to rabase? [y/n]"
read message

if [ $message = "y" ] || [ $message = "Y" ]; then
  echo "Running with git rebase..."
  sleep 1

  runrebase
  exit
elif [ $message = "n" ] || [ $message = "N" ]; then
  echo "Proceding to main file..."
else 
  echo "Not a valid responce. Proceding to main file..."
fi

git add .
git commit -m "Remote from codespaces"
git push origin main
sleep 0.3
clear

sleep 0.3
echo "Saved."
sleep 1.3
clear