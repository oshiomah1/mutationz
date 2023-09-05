script_dir="/share/hennlab/projects/mutationz/SNPEFF/delete_res/20230727_170013_snpeff_output"
filter_dir="/share/hennlab/projects/mutationz/SNPEFF/delete_res/20230727_170013_snpeff_output/filters/high_impact"

mkdir -p "$filter_dir" # Create the filter directory if it doesn't exist

for file in "$script_dir"/*_snpeff.genes.txt; do
    filename=$(basename "$file")  # Extract the filename without the path
    high_imp_filename="$filter_dir/high_filt_${filename%.txt}.tsv"  # Append high_filt and .tsv
    
    awk -F '\t' 'NR > 1 && $5 > 0' "$file" > "$high_imp_filename"
done