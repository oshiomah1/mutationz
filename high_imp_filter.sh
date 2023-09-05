#!/bin/bash
script_dir="/share/hennlab/projects/mutationz/SNPEFF/results/20230727_170013_snpeff_output"
filter_dir="/share/hennlab/projects/mutationz/SNPEFF/results/20230727_170013_snpeff_output/filters/high_impact"

mkdir -p "$filter_dir" # Create the filter directory if it doesn't exist

for file in "$script_dir"/*_snpeff.genes.txt; do
    filename=$(basename "$file")  # Extract the filename without the path
    high_imp_filename="$filter_dir/high_filt_${filename%.txt}.tsv"  # Append high_filt to the filename

    awk -F '\t' 'NR > 1 && $5 > 0' "$file" > "$high_imp_filename" # ignores the first row (column headers) && checks the 5th col (high effect variant)
done


