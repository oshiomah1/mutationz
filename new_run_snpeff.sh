#!/bin/bash

# Path to the snpeff.jar file
snpeff_jar="/software/snpeff/5.1/static/snpEff.jar"

# Genome version and statistics file
genome_version="GRCh38.v42"

# Directory where the chromosome files are located
input_dir="/share/hennlab/data/genomes/CAAPA_freeze1B"

# Create a timestamped folder to store the output
output_dir="$(date +'%Y%m%d_%H%M%S')_snpeff_output"
mkdir -p "$output_dir"

# Loop through each chromosome file and run snpeff.jar
for vcf_file in "${input_dir}"/Freeze1B_SNV_NOREF_phased_20230305_chr*.vcf.gz; do
    # Extract the chromosome number from the file name
    chromosome=$(basename "$vcf_file" | grep -oE '[0-9]+')

    # Output file names for snpeff results
    output_vcf="${output_dir}/chr${chromosome}_snpeff.vcf"
    output_html="${output_dir}/chr${chromosome}_snpeff.html"

    # Run snpeff.jar on the current chromosome file
    nice -6 java -Xmx8g -jar "$snpeff_jar" -v -stats "$output_html" "$genome_version" "$vcf_file" > "$output_vcf"

    echo "Processed chromosome $chromosome"
done

echo "Output files are saved in $output_dir"
