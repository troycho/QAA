#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH -c 8
#SBATCH --time=0-4

conda activate QAA
/usr/bin/time -v STAR \
    --runThreadN 8 \
    --runMode alignReads \
    --outFilterMultimapNmax 3 \
    --outSAMunmapped Within KeepPairs \
    --alignIntronMax 1000000 --alignMatesGapMax 1000000 \
    --readFilesCommand zcat \
    --readFilesIn 27_4C_mbnl_1P.fq.gz 27_4C_mbnl_2P.fq.gz \
    --genomeDir Mus_musculus.GRCm39.dna.ens112.STAR_2.7.11b/ \
    --outFileNamePrefix 27-4C-mbnl

exit