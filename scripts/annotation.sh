#!/bin/bash -e

module purge
module load Nextflow Apptainer

cd /nextflow/<fastq directory>/

nextflow run nf-core/sarek -profile singularity -r 3.2.3 --genome R64-1-1  --input ./samplesheet/samplesheet_anno.csv --outdir ./sarek_anno_snpeff --igenomes_base /nextflow/references  --step annotate --tools snpeff --snpeff_cache /nextflow/references/data --annotation_cache
