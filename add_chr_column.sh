

#!/bin/bash


for file in /share/hennlab/projects/mutationz/SNPEFF/delete_res/20230727_170013_snpeff_output/filters/high_impact/*.genes.tsv; do

  chr=$(grep -oP '_chr\K[0-9XY]+' <<< $file)
  
  awk -v chr=$chr 'BEGIN{OFS="\t"}  NR>1 {print $0, chr}' $file > "$file.tmp" && mv "$file.tmp" "$file"

done