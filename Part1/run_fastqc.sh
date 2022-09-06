#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --cpus-per-task=4
#SBATCH --partition=bgmp
#SBATCH --nodes=1
#SBATCH --job-name=fastqc1
module load fastqc/0.11.5

o_dir="/projects/bgmp/isisd/bioinfo/Bi622/QAA/Part1/output_fastqc"
seq7R1="/projects/bgmp/shared/2017_sequencing/demultiplexed/7_2E_fox_S6_L008_R1_001.fastq.gz"
seq7R2="/projects/bgmp/shared/2017_sequencing/demultiplexed/7_2E_fox_S6_L008_R2_001.fastq.gz"
seq19R1="/projects/bgmp/shared/2017_sequencing/demultiplexed/19_3F_fox_S14_L008_R1_001.fastq.gz"
seq19R2="/projects/bgmp/shared/2017_sequencing/demultiplexed/19_3F_fox_S14_L008_R2_001.fastq.gz"

/usr/bin/time -v fastqc \
    $seq7R1 $seq7R2 $seq19R1 $seq19R2 \
    --outdir $o_dir \
    --format fastq \
    --threads 4