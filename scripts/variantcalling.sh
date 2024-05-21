#!/bin/bash -e

module purge
module load Nextflow Apptainer

cd /nextflow/<fastq directory>

nextflow run nf-core/sarek -profile singularity -r 3.2.3 --genome R64-1-1  --input ./samplesheet/samplesheet_vc.csv --outdir ./sarek_vc --igenomes_base ../references  --step variant_calling --skip_tools baserecalibrator --intervals ROI.bed --tools haplotypecaller
