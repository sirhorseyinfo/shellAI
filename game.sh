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
  echo " Single player, or multiplayer?"
  echo -n "
    (1/2): "
  read -r gametype
  if [[ "$gametype" == 1 ]]; then
    sing_plyr
  elif [[ "$gametype" == 2 ]]; then
    mult_plyr
  else
    echo "Well, you have chose something."
    start_game
  fi
}

draw_board() {
  local type="$1"
  local turn="$2"
  local p1marks="$3"
  local p2marks="$4"
  if [[ "$type" == "new" ]]; then
    echo "Current turn: $turn

      |    |
      |    |
  ----+----+----
      |    |
      |    |
  ----+----+----
      |    |
      |    |
"
  else
    echo ""
  fi
}

sing_plyr() {
  sleep 0.3
  echo "Single player dont work yet. Sorry."
  exit
}

mult_plyr() {
  sleep 0.2
  clear
  draw_board "new"
  while true; do
    local winner=""
    local p1=("")
    local p2=("")
    local turn="p1"
    draw_board "current" "$turn" "$p1" "$p2"
    if [ -n "$winner" ]; then
      sleep 0.3
      clear
      echo "$winner won the game!"
      sleep 1.1
      echo "Start a new game?"
      echo -n " (yes/no): "
      read -r yn
      if [[ "$yn" == "yes" ]] || [[ "$yn" == "Yes" ]]; then
        echo "
Returning..."
        sleep 0.4
        start_game
      elif [[ "$yn" == "no" ]] || [[ "$yn" == "No" ]]; then
        echo "
Closing file..."
        sleep 0.5
        exit
      else
        echo -n "  You chose: "
        read -r pos
        if [[ "$turn" == "p1" ]]; then
          # if $pos starts with a, b, or c, and ends with 1, 2, or 3; then
            # add $pos to p1's variables
            draw_board "current" "$turn" "$p1" "$p2"
          # else
            # give the player an error and restart the game.
            echo "hi"
          # fi
        else
          # same thing as if the turn were p1's, but add $pos to p2's variables.
          echo "hi"
        fi
      fi
    fi
  done
  exit
}

menu_scrn