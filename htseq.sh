#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --mem=16G
#SBATCH --time=0-1

conda activate QAA
/usr/bin/time -v htseq-count 27-4C-mbnlAligned.out.sam genome-files/Mus_musculus.GRCm39.112.gtf \
    --stranded reverse \
    > 27_4C_mbnl-rev_counts.txt
