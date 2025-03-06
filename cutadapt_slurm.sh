#!/bin/bash
#SBATCH --account=def-makarenk
#SBATCH --output=%x.o%j
#SBATCH --error=%x.e%j
#SBATCH --mem=8Gb
#SBATCH --time=03:00:00

# Load Cutadapt module
module load mugqic/cutadapt/2.10

# Set variables for input and output directories
INPUT_DIR="/home/roo6688/scratch/atacseq/data"
OUTPUT_DIR="/home/roo6688/scratch/atacseq/data/trimmed"

# Define sample name (without _1 or _2 suffix)
SAMPLE="SRR891268"

# Run Cutadapt
cutadapt -q 20 \
    -a CTGTCTCTTATACACATCTCCGAGCCCACGAGAC \
    -A CTGTCTCTTATACACATCTGACGCTGCCGACGA \
    --minimum-length 20 \
    -o "${OUTPUT_DIR}/${SAMPLE}_1t.fastq" -p "${OUTPUT_DIR}/${SAMPLE}_2t.fastq" \
    "${INPUT_DIR}/${SAMPLE}_1.fastq" "${INPUT_DIR}/${SAMPLE}_2.fastq"
