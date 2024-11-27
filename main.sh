#!/bin/bash

# Load knowledge base
knowledge_file="knowledge/primary.txt"


# Function to find a response
get_response() {
  local query="$1"
  response=$(grep -i "^$query:" "$knowledge_file" | cut -d':' -f2-)
  echo "${response:-Sorry, I dont understand.}"
}

# Main interaction loop
echo "Ask me something (type \"exit\" to quit):"
while true; do
  read -p "> " user_input
  if [[ "$user_input" == "exit" ]]; then
    break
  fi
  get_response "$user_input"
done

exit
