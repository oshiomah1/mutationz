#!/bin/bash

# Specify the output merged file name
output_file="merged_output.csv"

# Create an empty output file
> /share/hennlab/projects/mutationz/SNPEFF/results/"$output_file"

# Loop through each text file
for file in /share/hennlab/projects/mutationz/SNPEFF/results/counts/*.txt; do
    # Use paste to merge the columns
    paste -d ' ' "/share/hennlab/projects/mutationz/SNPEFF/results/$output_file" <(awk '{print $1}' "$file") > "/tmp/temp_merged.csv"
    mv "/tmp/temp_merged.csv" "/share/hennlab/projects/mutationz/SNPEFF/results/$output_file"
done

echo "Merging complete. Output saved to $output_file."

