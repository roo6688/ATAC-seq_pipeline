#!/bin/bash
#SBATCH --account=def-makarenk
#SBATCH --output=%x.o%j
#SBATCH --error=%x.e%j
#SBATCH --mem=64Gb
#SBATCH --time=08:00:00
#SBATCH --ntasks-per-node=12

# Clean up the environment and load Bowtie2 module
module purge 2>/dev/null
module load mugqic/bowtie2/2.3.5

# Set directories and sample name
INPUT_DIR="/home/roo6688/scratch/atacseq/data/trimmed"
OUTPUT_DIR="/home/roo6688/scratch/atacseq/results/bowtie2"
REFGENOME_DIR="/home/roo6688/scratch/atacseq/data/refgenome"
SAMPLE="SRR891268"

# Change to the directory where the job was submitted
cd $SLURM_SUBMIT_DIR

# Run Bowtie2 alignment
bowtie2 \
 -x "${REFGENOME_DIR}/hg38_index" \
 -1 "${INPUT_DIR}/${SAMPLE}_1t.fastq" \
 -2 "${INPUT_DIR}/${SAMPLE}_2t.fastq" \
 -S "${OUTPUT_DIR}/mapping_${SAMPLE}.bam" \
 --very-sensitive \
 --end-to-end \
 --maxins 1000  # Set the maximum fragment length to 1000
