#!/bin/bash

INPUT_FILE="input.txt"

last_line=""

cat "$INPUT_FILE" | while read -r line; do
	if [[ -z "$last_line" ]]; then
		last_line="$line"
		continue
	fi

	#echo "$last_line" "$line";

	if [ "$last_line" -gt "$line" ]; then
		echo "decreased"
	else
		echo "increased"
	fi

	last_line="$line"
done
