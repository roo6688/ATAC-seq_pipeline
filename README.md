# ATAC-seq Analysis Pipeline on SLURM

Current Progress:
  Implemented FastQC, Cutadapt, and Bowtie2 for quality control, adapter trimming, and read alignment.
  Actively working on implementing the remaining steps of the ATAC-seq pipeline.

I am currently implementing the **ATAC-seq workflow** outlined in the Galaxy Project's tutorial (available [here](https://training.galaxyproject.org/training-material/topics/epigenetics/tutorials/atac-seq/tutorial.html)). However, instead of using the Galaxy platform, I am utilizing **Narval**, a SLURM-based high-performance computing (HPC) cluster, to process and analyze the data.

This repository contains scripts for processing and analyzing ATAC-seq data on a SLURM cluster using SSH on Narval. The pipeline includes the following key steps:
1. Quality Control using **FastQC**
2. Adapter trimming and quality filtering with **Cutadapt**
3. Read alignment with **Bowtie2**
4. Filtering uninformative reads with **BAMtools**
5. Marking duplicates using **MarkDuplicates**
6. Checking insert size distribution using **Picard's CollectInsertSizeMetrics**
7. Peak calling with **MACS2**
...

## Overview

This pipeline processes ATAC-seq data through a series of steps:
1. **Quality Control**: FastQC is used to evaluate the quality of raw sequencing data.
2. **Adapter Trimming**: Cutadapt trims adapter sequences and low-quality bases.
3. **Alignment**: Bowtie2 aligns the filtered reads to the reference genome (e.g., hg38).
4. **Filtering**: BAMtools is used to filter uninformative reads, and **MarkDuplicates** removes duplicate reads.
5. **Insert Size Distribution**: **Picard's CollectInsertSizeMetrics** generates histograms of the fragment size distribution.
6. **Peak Calling**: MACS2 identifies enriched regions of chromatin (peaks) based on the aligned data.
...

## Requirements

Before running the pipeline, ensure the following software is available:
- **FastQC** for quality control
- **Cutadapt** for trimming
- **Bowtie2** for read alignment
- **MACS2** for peak calling
- **BAMtools** for filtering BAM files
- **MarkDuplicates** (part of **Picard** tools) for marking duplicates
- **Picard's CollectInsertSizeMetrics** for insert size distribution analysis

  Note: All required tools are available through MugQIC modules.

Additionally, you will need access to a SLURM-based HPC cluster, such as Narval.

