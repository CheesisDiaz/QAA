#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --partition=bgmp
#SBATCH --nodes=1
conda activate QAA

reads1="/projects/bgmp/isisd/bioinfo/Bi623/QAA/Part2/output/19_3F_fox_S14_L008_R1_paired.fq.gz"
reads2="/projects/bgmp/isisd/bioinfo/Bi623/QAA/Part2/output/19_3F_fox_S14_L008_R2_paired.fq.gz"
genome_dir="Mus_musculus.GRCm39.107_star2.7.10a"
out_filename_prefix="aligned_19_3F_Mus_musculus.GRCm39.107_star2.7.10a."

/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
    --outFilterMultimapNmax 3 \
    --outSAMunmapped Within KeepPairs \
    --alignIntronMax 1000000 --alignMatesGapMax 1000000 \
    --readFilesCommand zcat \
    --readFilesIn $reads1 $reads2 \
    --genomeDir $genome_dir \
    --outFileNamePrefix $out_filename_prefix
