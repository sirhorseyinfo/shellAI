#/bin/bash

menu_scrn() {
  clear
  echo "Tick-Tack-Toe made from shell code"
  echo -n "
    Press enter key to start.  "
  read -r continue
  if [ -n "$continue" ]; then
    start_game
  else
    start_game
  fi
}

start_game() {
  sleep 0.5
  clear
  echo "    Single player, or multiplayer?"
  echo -n "
    (1/2): "
  read -r gametype
  if [[ "$gametype" == 1 ]]; then
    sing_plyr
  elif [[ "$gametype" == 2 ]]; then
    mult_plyr
  else
    echo "Well, you have chose something,"
    start_game
  fi
}

sing_plyr() {
  sleep 0.3
  echo "Hi!"
  exit
}

mult_plyr() {
  sleep 0.2
  echo "Hi!"
  exit
}

menu_scrn