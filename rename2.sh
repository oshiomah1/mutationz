#!/bin/bash

for filename in /share/hennlab/projects/mutationz/SNPEFF/20230727_170013_snpeff_output/*; do

  # Remove "1??" from filename
  new_filename=$(echo "$filename" | sed 's/^1??//')

  # Remove any newlines
  new_filename=$(echo "$new_filename" | tr -d '\n')

  # Rename file
  mv "$filename" "$new_filename"

done
