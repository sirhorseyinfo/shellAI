#!/bin/bash

# Function to add a question and answer to the primary.txt file
learn() {
  local query="$1"
  local response="$2"
  # Append the question and answer on the same line with a colon
  echo "$query: $response" >> "knowledge/primary.txt"
}

# Prompt the user to start teaching
echo "Teach me something new (type done to stop teaching):"
while true; do
  read -p "Question: " question
  [[ "$question" == "done" ]] && sleep 1 && break
  
  read -p "Answer: " answer
  learn "$question" "$answer"
  echo "Got it! Ask me that next time."
done