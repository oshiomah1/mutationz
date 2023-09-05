# Specify input and output folders
input_folder="/share/hennlab/projects/mutationz/SNPEFF/results/20230727_170013_snpeff_output"
output_folder="/share/hennlab/projects/mutationz/SNPEFF/results/counts"

# Loop through VCF files in the input folder
for vcf_file in "$input_folder"/*.vcf; do
    # Extract filename without extension
    filename=$(basename "$vcf_file" .vcf)
    
    # Create an output file for each VCF file
    output_file="$output_folder/${filename}_annotation_counts.txt"
    
    # Process the current VCF file
    grep -v '^#' "$vcf_file" | \
        awk -F'\t' '{ split($8, annotations, ";"); for (i in annotations) { if (annotations[i] ~ /^ANN=/) { split(annotations[i], ann_parts, "\\|"); print ann_parts[3] } } }' | \
        sort | \
        uniq -c > "$output_file"
    
    echo "Processed $vcf_file. Results saved to $output_file"
done
