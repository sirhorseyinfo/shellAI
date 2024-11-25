#/bin/bash

prompt_type="prompt-types.json"

echo "(AI): Hi, I'm Shelly! I'm a responsive AI built primarily from shell.
How can I help you today?"
read -r input_keyword

value=$(jq -r --arg keyword "$input_keyword" '.[$keyword] // "unknown"' "$prompt_type")3