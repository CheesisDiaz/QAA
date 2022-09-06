#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --partition=bgmp
#SBATCH --nodes=1
#SBATCH --job-name=star_data
conda activate QAA

out_directory="/projects/bgmp/isisd/bioinfo/Bi623/QAA/Part3/Mus_musculus.GRCm39.107_star2.7.10a"
dna_data="/projects/bgmp/isisd/bioinfo/Bi623/QAA/Part3/Mus_musculus.GRCm39.dna.primary_assembly.fa"
gtf_reference="/projects/bgmp/isisd/bioinfo/Bi623/QAA/Part3/Mus_musculus.GRCm39.107.gtf"

/usr/bin/time -v STAR \
    --runThreadN 8 \
    --runMode genomeGenerate \
    --genomeDir $out_directory \
    --genomeFastaFiles $dna_data \
    --sjdbGTFfile $gtf_reference