#!/bin/bash
#script to rename files

# Loop through each file in the directory
for file in /share/hennlab/projects/mutationz/SNPEFF/20230727_170013_snpeff_output/*; do
    # Extract the filename without the path
    filename=$(basename "$file")
    
    # Remove the pattern "chr1?20230305?" from the filename
    new_filename=$(echo "$filename" | sed 's/1\?20230305\?//')
    
    # Rename the file with the new filename
    mv "$file" "/share/hennlab/projects/mutationz/SNPEFF/20230727_170013_snpeff_output/$new_filename"
done



