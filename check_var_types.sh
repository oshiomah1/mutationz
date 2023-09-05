# Assuming 'input.vcf' is your VCF file
grep -v '^#' test1_chr21.vcf | cut -f 8 | awk -F ';' '{print $1}' | cut -d '=' -f 2 | sort | uniq -c > del.results

#To search a VCF file for the different common values in the IMPACT field, you can use various command-line tools and scripting languages. One common approach is to use grep, awk, or cut in combination with sort and uniq to extract and count the unique values in the IMPACT field.
