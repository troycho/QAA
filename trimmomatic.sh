#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --mem=16G
#SBATCH --time=1-0
#SBATCH --mail-user=taro@uoregon.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name=trim

conda activate QAA
/usr/bin/time -v trimmomatic PE 27_4C_mbnl_S19_L008_R1_cutadapt.fq 27_4C_mbnl_S19_L008_R2_cutadapt.fq \
    -baseout 27_4C_mbnl.fq.gz \
    LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35