#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH -c 8
#SBATCH --time=0-4

conda activate QAA
/usr/bin/time -v STAR \
    --runThreadN 8 \
    --runMode genomeGenerate \
    --genomeDir Mus_musculus.GRCm39.dna.ens112.STAR_2.7.11b/ \
    --genomeFastaFiles genome-files/Mus_musculus.GRCm39.dna.primary_assembly.fa \
    --sjdbGTFfile genome-files/Mus_musculus.GRCm39.112.gtf

exit