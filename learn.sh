learn() {
  local query="$1"
  local response="$2"
  echo "$query: $response" >> "$knowledge_file"
}

echo "Teach me something new (type 'done' to stop teaching):"
while true; do
  read -p "Question: " question
  [[ "$question" == "done" ]] && break
  read -p "Answer: " answer
  learn "$question" "$answer"
  echo "Got it! Ask me that next time."
done