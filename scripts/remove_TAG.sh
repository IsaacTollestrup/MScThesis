#!/bin/bash

    cd /combined_vcf/

    # Path to the directory containing your .vcf.gz files
    vcf_dir="../nextflow/<3ploid fastq directory>/sarek_anno_snpeff/annotation"

    # Output directory for modified files
    output_dir="./combined_3ploid"
    mkdir -p "$output_dir"

    # List of .vcf.gz files
    file_list="3ploid.list"

    # Display the file list for troubleshooting
    echo "Files to process:"
    cat "$file_list"

    # Renaming files in new directory
while IFS= read -r vcf_file || [ -n "$vcf_file" ]; do
    filename=$(basename "$vcf_file")
    
    output_file="${filename%.vcf.gz}_removed.vcf.gz"
    
    # Use BCFTools to remove all tags
    bcftools annotate -x FORMAT/PL -O z -o "${output_dir}/${output_file}" "${vcf_dir}/${vcf_file}"
    
done < "$file_list"
