#!/bin/bash -e

module purge
module load Nextflow Apptainer

cd /nextflow	

nextflow run nf-core/fetchngs -profile singularity --input ./<list of accession IDs>.csv --outdir ./<fastq directory>/
