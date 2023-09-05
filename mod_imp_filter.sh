#!/bin/bash
script_dir="/share/hennlab/projects/mutationz/SNPEFF/results/20230727_170013_snpeff_output"
filter_dir="/share/hennlab/projects/mutationz/SNPEFF/results/20230727_170013_snpeff_output/filters/mod_impact"

mkdir -p "$filter_dir" # Create the filter directory if it doesn't exist

for file in "$script_dir"/*_snpeff.genes.txt; do
    filename=$(basename "$file")  # Extract the filename without the path
    mod_imp_filename="$filter_dir/mod_filt_${filename%.txt}.tsv"  # Append high_filt to the filename
    
    awk -F '\t' 'NR > 1 && $7 > 0' "$file" > "$mod_imp_filename" # ignores the first row (column headers) && checks the 7th col (moderate effect variant)
done
