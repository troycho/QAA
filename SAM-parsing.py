#!/usr/bin/env python
import argparse

def get_args():
    parser = argparse.ArgumentParser(description="Report number of mapped and unmapped reads in SAM file")
    parser.add_argument("-f", "--file", help="Input SAM file")
    return parser.parse_args()

args = get_args()

mapped: int=0 #counts reads that are mapped to genome
unmapped: int=0 #counts reads that are not mapped to genome

with open(args.file, "r") as fh:
    for line in fh:
        line = line.strip("\n")
        if line.startswith("@"):
            continue
        fields: list=line.split("\t")
        flag = int(fields[1]) #extracts bitwise flag
        if (flag & 256) != 256: #if alignment is not secondary
            if (flag & 4) != 4: #if read is not unmapped
                mapped += 1
            else:
                unmapped += 1

print(f"Number of mapped: {mapped}")
print(f"Number of unmapped: {unmapped}")