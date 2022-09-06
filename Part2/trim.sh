#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --cpus-per-task=1
#SBATCH --partition=bgmp
#SBATCH --nodes=1
#SBATCH --time=0-10:00:00
#SBATCH --job-name=trimm

conda activate QAA

#Input
forward1="7_2E_fox_S6_L008_R1_001_cutadapt.fastq.gz"
reverse1="7_2E_fox_S6_L008_R2_001_cutadapt.fastq.gz"

forward2="19_3F_fox_S14_L008_R1_001_cutadapt.fastq.gz"
reverse2="19_3F_fox_S14_L008_R2_001_cutadapt.fastq.gz"
#Output
forwardun1="output/7_2E_fox_S6_L008_R1_unpaired.fq.gz"
forwardpa1="output/7_2E_fox_S6_L008_R1_paired.fq.gz"
reverseun1="output/7_2E_fox_S6_L008_R2_unpaired.fq.gz"
reversepa1="output/7_2E_fox_S6_L008_R2_paired.fq.gz"

forwardun2="output/19_3F_fox_S14_L008_R1_unpaired.fq.gz"
forwardpa2="output/19_3F_fox_S14_L008_R1_paired.fq.gz"
reverseun2="output/19_3F_fox_S14_L008_R2_unpaired.fq.gz"
reversepa2="output/19_3F_fox_S14_L008_R2_paired.fq.gz"




# /usr/bin/time -v trimmomatic PE $forward1 $reverse1 \
#     $forwardpa1 $forwardun1 $reversepa1 $reverseun1 \
#     LEADING:3 \
#     TRAILING:3 \
#     SLIDINGWINDOW:5:15 \
#     MINLEN:35
# echo "Finish first file"

/usr/bin/time -v trimmomatic PE $forward2 $reverse2 \
    $forwardpa2 $forwardun2 $reversepa2 $reverseun2 \
    LEADING:3 \
    TRAILING:3 \
    SLIDINGWINDOW:5:15 \
    MINLEN:35

echo "Done with everything"