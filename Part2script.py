#!/usr/bin/env python
import argparse
import matplotlib.pyplot as plt
import gzip

def get_args():
    parser = argparse.ArgumentParser(description="Generate histogram for trimmed read length distribution")
    parser.add_argument("-r1",  help="Paired read 1 dist file")
    parser.add_argument("-r2", help="Paired read 2 dist file")
    parser.add_argument("-l", help="Library name")
    return parser.parse_args()

def appendValues(file: str, lengths: list) -> None:
    '''Takes gzipped fastq file with trimmed reads as input. Finds lengths of reads and appends these values
    to list that is passed to function.'''
    with gzip.open(file, "rt") as fh:
        for i, line in enumerate(fh):
            line = line.strip("\n")
            if i%4 == 1: #if sequence line
                lengths.append(len(line)) #Append length of read

args = get_args()
r1_lengths: list = []
r2_lengths: list = []

appendValues(args.r1, r1_lengths)
appendValues(args.r2, r2_lengths)

# Generate read length distribution plots
plt.hist([r1_lengths, r2_lengths], bins=20, label=['R1', 'R2'], color=['#FF7F0E', '#98DF8A'])
plt.legend(loc='upper left')
plt.yscale("log")
plt.title(f"Lengths of Trimmed Reads for {args.l}")
plt.xlabel("Read Length")
plt.ylabel("Frequency")
plt.savefig(f"{args.l}_hist.png")