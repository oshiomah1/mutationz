#!/bin/bash

# Specify the output merged file name
output_file="merged_output.csv"

# Loop through each text file
for file in /share/hennlab/projects/mutationz/SNPEFF/results/counts/*.txt; do
    # Extract the first column and append it to the output file
    awk '{print $1}' "$file" >> /share/hennlab/projects/mutationz/SNPEFF/results/"$output_file"
done

echo "Merging complete. Output saved to $output_file."

