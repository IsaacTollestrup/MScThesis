#!/bin/bash -e

module purge
module load Nextflow Apptainer

cd /nextflow	

nextflow run nf-core/sarek -profile singularity -r 3.2.3 --genome R64-1-1  --input ./<fastq directory>/samplesheet/samplesheet.csv --outdir ./<fastq directory>/sarek/ --save_mapped --save_output_as_bam --igenomes_base ./references/ --skip_tools baserecalibrator
