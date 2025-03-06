#!/bin/bash
#SBATCH --account=def-makarenk
#SBATCH --output=%x.o%j
#SBATCH --error=%x.e%j
#SBATCH --mem=8Gb

# Load necessary modules
module purge 2>/dev/null
module load mugqic/fastqc/0.11.5
module load mugqic/java

# Move to the submission directory
cd $SLURM_SUBMIT_DIR

# Define variables for input and output paths
INPUT_DIR="/home/roo6688/scratch/atacseq/data"
OUTPUT_DIR="/home/roo6688/scratch/atacseq/results/fastqc"

# List of samples (modify as needed)
SAMPLES=("SRR891268_1" "SRR891268_2")

# Run FastQC on each sample
for SAMPLE in "${SAMPLES[@]}"; do
    fastqc --outdir "$OUTPUT_DIR" "$INPUT_DIR/${SAMPLE}.fastq" &> "fastqc_${SAMPLE}.sh.log"
done
