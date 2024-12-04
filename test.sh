#/bin/bash

# file links
MEMORY_FILE=”(path to memory file)”
LOG_FILE=”(path to overall log sheet)”


store_interaction() {
  local prompt=”$1”
  local response=”$2”
  echo “PROMPT: $prompt” >> “$MEMORY_FILE”
  echo “RESPONSE: $response” >> “$MEMORY_FILE”
  echo “---------------” >> “$MEMORY_FILE”
}

get_response() {
  local prompt=”$1”
  grep -A 1 “PROMPT: $prompt” “$MEMORY_FILE” | grep “RESPONSE” | head -n 1 | cut -d ‘:’ -f 2 | sed ‘s/^ //’
}

generate_response() {
  local prompt=”$1”
  local stored_response=$(get_response “$prompt”)
  if [ -n “$stored_response” ]; then
    echo “$stored_response”
  else
    echo “Sorry, I do not know how to respond to that.”
    store_interaction “$prompt” “Well, this is embarrassing... I have already been asked this, but I still have not learned how to respond.”
    # log error details to the log sheet
  fi
}

match_prompt() {
  local input=”$1”
  local best_match=””
  local highest_match_score=0

  while read -r line; do
    if [[ “$line” =~ PROMPT: ]]; then
      local prompt=”${line#PROMPT: }”
      local score=0

      if [[ “$input” == *“$prompt”* ]]; then
        score=1
      fi
      if [ “$score” -gt “$highest_match_score” ]; then
        best_match=”$prompt”
        highest_match_score=”$score”
      fi
    fi
  done < “$MEMORY_FILE”
  echo “$best_match”
}

generate_response() {
  local input=”$1”
  local matched_prompt
  matched_prompt=$(match_prompt “$input”)

  if [[ -n “$matched_prompt” ]]; then
    local response=””
    local found=false

    while -r line; do
      if [[ “$line” == “PROMPT: $matched_prompt”  ]]; then
        found=true
      elif $found && [[ “$line” == RESPONSE: * ]]; then
        response=”${line#RESPONSE: }”
        echo “$response”
        return
      fi
    done < “$MEMORY_FILE”
  else
    echo “Sorry, I do not know how to respond to that.”
    # log error details to the log sheet
  fi
}

echo “Hi, Im Shelly! Can I help you with anything? (type exit to quit)”

while true; do
  echo -n “ >”
  read -r input
  if [[ “$input” == “exit” ]]; then
    echo “Bye! See you next time.”
    sleep 0.9
    break
  fi
  response=$(generate_response “$input”)
  if [[ “$response” == “Sorry, I do not know how to respond to that.” ]]; then
    echo “AI: $response”
    echo -n “Can you teach me? (yes/no)”
    read -r teach

    if [[ “$teach” == “yes” ]]; then
      echo -n “What should I say next time?”
      read -r new_response

      store_interaction “$input” “$new_response”
      echo “Thanks! I will remember that for next time.”
    fi
  else
    echo “AI: $response”
  fi
done
