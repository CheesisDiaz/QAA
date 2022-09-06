#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --cpus-per-task=4
#SBATCH --partition=bgmp
#SBATCH --nodes=1
#SBATCH --job-name=distrib_plot

conda activate bgmp_py310

    # parser.add_argument("-p", "--position", help="How many bps are per sequence?", required=True, type=int)
    # parser.add_argument("-l", "--length", help="How many reads are in this file?", required=True, type=int)
    # parser.add_argument("-f", "--file", help="Specify the filename to analyze (FASTQ format)", required=True, type=str)
    # parser.add_argument("-o", "--output", help="Specify the output filename for the graph", required=True, type=str)

#output files
output_file7R1="/projects/bgmp/isisd/bioinfo/Bi623/QAA/Part1/7_2E_fox_S6_L008_R1_001.jpg"
output_file7R2="/projects/bgmp/isisd/bioinfo/Bi623/QAA/Part1/7_2E_fox_S6_L008_R2_001.jpg"
output_file19R1="/projects/bgmp/isisd/bioinfo/Bi623/QAA/Part1/19_3F_fox_S14_L008_R1_001.jpg"
output_file19R2="/projects/bgmp/isisd/bioinfo/Bi623/QAA/Part1/19_3F_fox_S14_L008_R2_001.jpg"

#input files
seq7R1="/projects/bgmp/shared/2017_sequencing/demultiplexed/7_2E_fox_S6_L008_R1_001.fastq.gz"
seq7R2="/projects/bgmp/shared/2017_sequencing/demultiplexed/7_2E_fox_S6_L008_R2_001.fastq.gz"
seq19R1="/projects/bgmp/shared/2017_sequencing/demultiplexed/19_3F_fox_S14_L008_R1_001.fastq.gz"
seq19R2="/projects/bgmp/shared/2017_sequencing/demultiplexed/19_3F_fox_S14_L008_R2_001.fastq.gz"

#RUNNING 7 for R1
/usr/bin/time -v ./Distribution_hist.py \
    -p 101 \
    -l 5278425 \
    -f $seq7R1 \
    -o $output_file7R1
echo "Finish 7R1"
#RUNNING 7 for R2
/usr/bin/time -v ./Distribution_hist.py \
    -p 101 \
    -l 5278425 \
    -f $seq7R2 \
    -o $output_file7R2
echo "Finish 7R2"
#RUNNING 19 for R1
/usr/bin/time -v ./Distribution_hist.py \
    -p 101 \
    -l 16348255 \
    -f $seq19R1 \
    -o $output_file19R1
echo "Finish 19R1"
#RUNNING 19 for R1
/usr/bin/time -v ./Distribution_hist.py \
    -p 101 \
    -l 16348255 \
    -f $seq19R2 \
    -o $output_file19R2
echo "Finish 19R2"
#OBTAINING DATA
#Lines in each file 
# zcat 7_2E_fox_S6_L008_R1_001.fastq.gz | grep "^@K00" | wc -l

#Read Length
# zcat 7_2E_fox_S6_L008_R1_001.fastq.gz | head -4 | sed -n '2p' | wc 
# -1 (new line character)