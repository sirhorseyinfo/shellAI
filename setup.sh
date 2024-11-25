#/bin/bash

sleep 1
clear

echo "Continue to the setup protocall? [y/n]"
read confirm

if [ $confirm = "y" ] || [ $confirm = "Y" ]; then
  echo "
Running setup protocall..."

  chmod +x main.sh
  
elif [ $confirm = "n" ] || [ $confirm = "N" ]; then
  echo "
(!Wrn!): Skipping the setup protocall may result in the software not running properly."
  sleep 3

  exit
else
  echo "(!Err!): Not a valid input. Reopening file..."
  sleep 1

  clear
  ./setup.sh
fi