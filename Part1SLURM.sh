#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --mem=12G
#SBATCH --time=1-0
#SBATCH --job-name=Run1

/usr/bin/time -v ./Part1.py \
    -f /projects/bgmp/shared/2017_sequencing/demultiplexed/17_3E_fox_S13_L008_R1_001.fastq.gz \
    -r 101 \
    -o "17_3E_fox_S13_L008_R1"