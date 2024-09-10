**8/26/24**
## FastQC installation
First, I got onto an interactive node with the command `srun -A bgmp -p bgmp -N 1 --mem=16G -t 1-0 --pty bash`.<br> I created the environment "QAA" with `conda create -n "QAA"` and activated it. In this environment, I conda installed FastQC. `fastqc --version` showed that the version is 0.12.1 (the desired version).
## Initial data exploration
Files I'm working with:
`Tayana  17_3E_fox_S13_L008      27_4C_mbnl_S19_L008`
<br>File paths:
`/projects/bgmp/shared/2017_sequencing/demultiplexed/17_3E_fox_S13_L008_R1_001.fastq.gz`
`/projects/bgmp/shared/2017_sequencing/demultiplexed/17_3E_fox_S13_L008_R2_001.fastq.gz`
`/projects/bgmp/shared/2017_sequencing/demultiplexed/27_4C_mbnl_S19_L008_R1_001.fastq.gz`
`/projects/bgmp/shared/2017_sequencing/demultiplexed/27_4C_mbnl_S19_L008_R2_001.fastq.gz`
<br>Number of records in each file:
*17_3E_fox_S13_L008_R1 and 17_3E_fox_S13_L008_R2:* 11784410<br>*27_4C_mbnl_S19_L008_R1 and 27_4C_mbnl_S19_L008_R2:* 7226430
## Part 1: Read quality score distributions
### FastQC runs
```
Command being timed: "fastqc /projects/bgmp/shared/2017_sequencing/demultiplexed/17_3E_fox_S13_L008_R1_001.fastq.gz /projects/bgmp/shared/2017_sequencing/demultiplexed/17_3E_fox_S13_L008_R2_001.fastq.gz -o FastQC-output/"

User time (seconds): 101.44
System time (seconds): 4.16
Percent of CPU this job got: 97%
Elapsed (wall clock) time (h:mm:ss or m:ss): 1:48.55
Average shared text size (kbytes): 0
Average unshared data size (kbytes): 0
Average stack size (kbytes): 0
Average total size (kbytes): 0
Maximum resident set size (kbytes): 269520
Average resident set size (kbytes): 0
Major (requiring I/O) page faults: 319
Minor (reclaiming a frame) page faults: 58737
Voluntary context switches: 6775
Involuntary context switches: 3505
Swaps: 0
File system inputs: 60112
File system outputs: 4960
Socket messages sent: 0
Socket messages received: 0
Signals delivered: 0
Page size (bytes): 4096
Exit status: 0
```

 ```
Command being timed: "fastqc /projects/bgmp/shared/2017_sequencing/demultiplexed/27_4C_mbnl_S19_L008_R1_001.fastq.gz /projects/bgmp/shared/2017_sequencing/demultiplexed/27_4C_mbnl_S19_L008_R2_001.fastq.gz -o FastQC-output/"

User time (seconds): 65.21
System time (seconds): 2.71
Percent of CPU this job got: 97%
Elapsed (wall clock) time (h:mm:ss or m:ss): 1:09.62
Average shared text size (kbytes): 0
Average unshared data size (kbytes): 0
Average stack size (kbytes): 0
Average total size (kbytes): 0
Maximum resident set size (kbytes): 295768
Average resident set size (kbytes): 0
Major (requiring I/O) page faults: 0
Minor (reclaiming a frame) page faults: 64965
Voluntary context switches: 3962
Involuntary context switches: 2378
Swaps: 0
File system inputs: 0
File system outputs: 4672
Socket messages sent: 0
Socket messages received: 0
Signals delivered: 0
Page size (bytes): 4096
Exit status: 0
```

### My own script
```
#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --mem=12G
#SBATCH --time=1-0
#SBATCH --mail-user=taro@uoregon.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name=Fox_R1

/usr/bin/time -v ./Part1.py \
    -f /projects/bgmp/shared/2017_sequencing/demultiplexed/17_3E_fox_S13_L008_R1_001.fastq.gz \
    -r 101 \
    -o "17_3E_fox_S13_L008_R1"
```

```
Command being timed: "./Part1.py -f /projects/bgmp/shared/2017_sequencing/demultiplexed/17_3E_fox_S13_L008_R1_001.fastq.gz -r 101 -o 17_3E_fox_S13_L008_R1"
	User time (seconds): 357.42
	System time (seconds): 0.13
	Percent of CPU this job got: 98%
	Elapsed (wall clock) time (h:mm:ss or m:ss): 6:03.45
	Average shared text size (kbytes): 0
	Average unshared data size (kbytes): 0
	Average stack size (kbytes): 0
	Average total size (kbytes): 0
	Maximum resident set size (kbytes): 62924
	Average resident set size (kbytes): 0
	Major (requiring I/O) page faults: 0
	Minor (reclaiming a frame) page faults: 13864
	Voluntary context switches: 2089
	Involuntary context switches: 927
	Swaps: 0
	File system inputs: 0
	File system outputs: 0
	Socket messages sent: 0
	Socket messages received: 0
	Signals delivered: 0
	Page size (bytes): 4096
	Exit status: 0
```

```
Command being timed: "./Part1.py -f /projects/bgmp/shared/2017_sequencing/demultiplexed/17_3E_fox_S13_L008_R2_001.fastq.gz -r 101 -o 17_3E_fox_S13_L008_R2"
	User time (seconds): 364.61
	System time (seconds): 0.19
	Percent of CPU this job got: 99%
	Elapsed (wall clock) time (h:mm:ss or m:ss): 6:06.48
	Average shared text size (kbytes): 0
	Average unshared data size (kbytes): 0
	Average stack size (kbytes): 0
	Average total size (kbytes): 0
	Maximum resident set size (kbytes): 65024
	Average resident set size (kbytes): 0
	Major (requiring I/O) page faults: 0
	Minor (reclaiming a frame) page faults: 13894
	Voluntary context switches: 435
	Involuntary context switches: 1128
	Swaps: 0
	File system inputs: 0
	File system outputs: 0
	Socket messages sent: 0
	Socket messages received: 0
	Signals delivered: 0
	Page size (bytes): 4096
	Exit status: 0
```

```
Command being timed: "./Part1.py -f /projects/bgmp/shared/2017_sequencing/demultiplexed/27_4C_mbnl_S19_L008_R1_001.fastq.gz -r 101 -o 27_4C_mbnl_S19_L008_R1"
	User time (seconds): 223.30
	System time (seconds): 0.27
	Percent of CPU this job got: 99%
	Elapsed (wall clock) time (h:mm:ss or m:ss): 3:44.57
	Average shared text size (kbytes): 0
	Average unshared data size (kbytes): 0
	Average stack size (kbytes): 0
	Average total size (kbytes): 0
	Maximum resident set size (kbytes): 62548
	Average resident set size (kbytes): 0
	Major (requiring I/O) page faults: 0
	Minor (reclaiming a frame) page faults: 13297
	Voluntary context switches: 375
	Involuntary context switches: 637
	Swaps: 0
	File system inputs: 0
	File system outputs: 0
	Socket messages sent: 0
	Socket messages received: 0
	Signals delivered: 0
	Page size (bytes): 4096
	Exit status: 0
```

```
	Command being timed: "./Part1.py -f /projects/bgmp/shared/2017_sequencing/demultiplexed/27_4C_mbnl_S19_L008_R2_001.fastq.gz -r 101 -o 27_4C_mbnl_S19_L008_R2"
	User time (seconds): 226.24
	System time (seconds): 0.16
	Percent of CPU this job got: 99%
	Elapsed (wall clock) time (h:mm:ss or m:ss): 3:47.51
	Average shared text size (kbytes): 0
	Average unshared data size (kbytes): 0
	Average stack size (kbytes): 0
	Average total size (kbytes): 0
	Maximum resident set size (kbytes): 62456
	Average resident set size (kbytes): 0
	Major (requiring I/O) page faults: 0
	Minor (reclaiming a frame) page faults: 13741
	Voluntary context switches: 376
	Involuntary context switches: 747
	Swaps: 0
	File system inputs: 0
	File system outputs: 0
	Socket messages sent: 0
	Socket messages received: 0
	Signals delivered: 0
	Page size (bytes): 4096
	Exit status: 0
```

---
## Part 2: Adaptor trimming 
### Setup/Installation
I installed cutadapt version 4.9 and trimmomatic version 0.39 in my QAA conda environment.
### cutadapt
**Commands to confirm adapters and sequence orientations in each file:**
```
zcat <read1.fq> | grep "AGATCGGAAGAGCACACGTCTGAACTCCAGTCA"
zcat <read2.fq> | grep "AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT"
```
**First pair of fastq files command (17_3E_fox):**
```
cutadapt -a "AGATCGGAAGAGCACACGTCTGAACTCCAGTCA" -A "AGATCGGAAGAGCG
TCGTGTAGGGAAAGAGTGT" -o 17_3E_fox_S13_L008_R1_cutadapt.fq -p 17_3E_fox_S13_L008_R2_cutadapt.fq /projects/bg
mp/shared/2017_sequencing/demultiplexed/17_3E_fox_S13_L008_R1_001.fastq.gz /projects/bgmp/shared/2017_seque
ncing/demultiplexed/17_3E_fox_S13_L008_R2_001.fastq.gz
```
**Summary of results **:
```
=== Summary ===

Total read pairs processed:         11,784,410
  Read 1 with adapter:               1,024,588 (8.7%)
  Read 2 with adapter:               1,104,503 (9.4%)
Pairs written (passing filters):    11,784,410 (100.0%)

Total basepairs processed: 2,380,450,820 bp
  Read 1: 1,190,225,410 bp
  Read 2: 1,190,225,410 bp
Total written (filtered):  2,335,751,295 bp (98.1%)
  Read 1: 1,168,027,279 bp
  Read 2: 1,167,724,016 bp

=== First read: Adapter 1 ===

Sequence: AGATCGGAAGAGCACACGTCTGAACTCCAGTCA; Type: regular 3'; Length: 33; Trimmed: 1024588 times

Minimum overlap: 3
No. of allowed errors:
1-9 bp: 0; 10-19 bp: 1; 20-29 bp: 2; 30-33 bp: 3

Bases preceding removed adapters:
  A: 16.1%
  C: 29.9%
  G: 34.4%
  T: 13.1%
  none/other: 6.4%

Overview of removed sequences
length  count   expect  max.err error counts
3       225955  184131.4        0       225955
4       66666   46032.9 0       66666
5       35777   11508.2 0       35777
6       25568   2877.1  0       25568
7       24280   719.3   0       24280
8       23497   179.8   0       23497
9       23284   45.0    0       23009 275
10      23486   11.2    1       22633 853
11      22250   2.8     1       21493 757
12      22031   0.7     1       21267 764
13      21493   0.2     1       20780 713
14      20992   0.0     1       20277 715
15      20729   0.0     1       19970 759
16      20104   0.0     1       19316 788
17      19444   0.0     1       18610 834
18      18735   0.0     1       17954 761 20
19      17917   0.0     1       17041 840 36
20      17612   0.0     2       16716 789 107
21      16784   0.0     2       15947 745 92
22      16414   0.0     2       15556 749 109
23      16116   0.0     2       15207 805 104
24      15528   0.0     2       14709 716 103
25      15233   0.0     2       14396 735 102
26      14526   0.0     2       13654 772 100
27      13947   0.0     2       13057 770 110 10
28      13344   0.0     2       12519 718 95 12
29      12508   0.0     2       11698 695 104 11
30      12041   0.0     3       11191 707 105 38
31      11601   0.0     3       10771 714 84 32
32      10994   0.0     3       10186 650 104 54
33      10295   0.0     3       9573 584 105 33
34      9834    0.0     3       9170 543 92 29
35      9290    0.0     3       8657 527 76 30
36      8851    0.0     3       8263 477 88 23
37      8509    0.0     3       7954 478 61 16
38      8200    0.0     3       7673 443 57 27
39      7677    0.0     3       7192 412 45 28
40      7305    0.0     3       6858 392 45 10
41      6616    0.0     3       6218 344 38 16
42      6034    0.0     3       5664 325 38 7
43      5472    0.0     3       5140 284 35 13
44      4932    0.0     3       4638 266 23 5
45      4696    0.0     3       4393 273 24 6
46      4063    0.0     3       3826 202 29 6
47      3834    0.0     3       3607 191 24 12
48      3522    0.0     3       3326 164 25 7
49      3301    0.0     3       3076 190 28 7
50      3044    0.0     3       2873 154 14 3
51      2647    0.0     3       2492 133 19 3
52      2488    0.0     3       2350 117 14 7
53      2071    0.0     3       1937 111 14 9
54      1881    0.0     3       1783 84 11 3
55      1615    0.0     3       1525 75 14 1
56      1351    0.0     3       1279 65 6 1
57      1387    0.0     3       1306 73 8
58      1214    0.0     3       1143 65 2 4
59      1099    0.0     3       1032 55 11 1
60      1039    0.0     3       978 49 10 2
61      963     0.0     3       911 37 14 1
62      912     0.0     3       864 40 7 1
63      773     0.0     3       721 43 7 2
64      683     0.0     3       641 36 4 2
65      547     0.0     3       513 27 6 1
66      527     0.0     3       494 27 5 1
67      456     0.0     3       433 18 5
68      445     0.0     3       425 20
69      408     0.0     3       383 23 1 1
70      372     0.0     3       353 18 0 1
71      330     0.0     3       311 14 1 4
72      297     0.0     3       285 10 2
73      245     0.0     3       233 10 2
74      206     0.0     3       190 11 5
75      157     0.0     3       141 14 2
76      103     0.0     3       91 11 1
77      85      0.0     3       81 3 1
78      75      0.0     3       66 9
79      75      0.0     3       66 7 1 1
80      28      0.0     3       25 1 2
81      34      0.0     3       32 2
82      15      0.0     3       14 1
83      19      0.0     3       18 1
84      14      0.0     3       14
85      21      0.0     3       19 1 1
86      8       0.0     3       8
87      17      0.0     3       17
88      12      0.0     3       12
89      25      0.0     3       24 1
90      11      0.0     3       10 0 0 1
91      17      0.0     3       14 2 1
92      5       0.0     3       4 0 0 1
93      12      0.0     3       11 1
94      9       0.0     3       6 3
95      13      0.0     3       13
96      13      0.0     3       12 1
97      4       0.0     3       4
98      12      0.0     3       11 0 1
99      5       0.0     3       5
100     10      0.0     3       9 1
101     65502   0.0     3       6 58739 6317 440


=== Second read: Adapter 2 ===

Sequence: AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT; Type: regular 3'; Length: 33; Trimmed: 1104503 times

Minimum overlap: 3
No. of allowed errors:
1-9 bp: 0; 10-19 bp: 1; 20-29 bp: 2; 30-33 bp: 3

Bases preceding removed adapters:
  A: 16.3%
  C: 32.8%
  G: 37.0%
  T: 7.9%
  none/other: 5.9%

Overview of removed sequences
length  count   expect  max.err error counts
3       287280  184131.4        0       287280
4       79052   46032.9 0       79052
5       37530   11508.2 0       37530
6       26927   2877.1  0       26927
7       24555   719.3   0       24555
8       23609   179.8   0       23609
9       23651   45.0    0       23225 426
10      23709   11.2    1       22832 877
11      22464   2.8     1       21739 725
12      22184   0.7     1       21611 573
13      21583   0.2     1       21051 532
14      21079   0.0     1       20572 507
15      20784   0.0     1       20143 641
16      20170   0.0     1       19626 544
17      19532   0.0     1       18908 624
18      18815   0.0     1       18062 746 7
19      17998   0.0     1       17386 599 13
20      17658   0.0     2       16908 669 81
21      16843   0.0     2       16105 657 81
22      16499   0.0     2       15813 622 64
23      16152   0.0     2       15491 578 83
24      15590   0.0     2       14847 663 80
25      15271   0.0     2       14511 663 97
26      14568   0.0     2       13851 622 95
27      14001   0.0     2       13356 540 103 2
28      13388   0.0     2       12746 553 85 4
29      12565   0.0     2       11905 564 88 8
30      12075   0.0     3       11447 536 69 23
31      11623   0.0     3       10739 743 108 33
32      11044   0.0     3       10417 493 108 26
33      10317   0.0     3       9727 473 78 39
34      9869    0.0     3       9297 451 85 36
35      9309    0.0     3       8797 424 65 23
36      8884    0.0     3       8408 384 61 31
37      8533    0.0     3       8029 408 62 34
38      8221    0.0     3       7735 375 66 45
39      7687    0.0     3       7255 339 65 28
40      7338    0.0     3       6925 324 60 29
41      6627    0.0     3       6298 259 38 32
42      6044    0.0     3       5720 261 42 21
43      5480    0.0     3       5196 235 26 23
44      4966    0.0     3       4700 210 36 20
45      4708    0.0     3       4444 220 28 16
46      4080    0.0     3       3892 155 24 9
47      3857    0.0     3       3650 166 20 21
48      3536    0.0     3       3332 175 21 8
49      3326    0.0     3       3154 128 26 18
50      3066    0.0     3       2890 143 25 8
51      2675    0.0     3       2514 128 20 13
52      2511    0.0     3       2380 104 21 6
53      2083    0.0     3       1971 89 13 10
54      1913    0.0     3       1803 85 11 14
55      1635    0.0     3       1506 102 18 9
56      1379    0.0     3       1292 71 11 5
57      1409    0.0     3       1317 68 17 7
58      1241    0.0     3       1168 59 10 4
59      1126    0.0     3       1043 62 13 8
60      1054    0.0     3       992 54 4 4
61      982     0.0     3       912 50 9 11
62      933     0.0     3       863 51 10 9
63      790     0.0     3       739 34 7 10
64      704     0.0     3       656 32 12 4
65      566     0.0     3       516 38 8 4
66      543     0.0     3       503 33 6 1
67      472     0.0     3       434 28 8 2
68      463     0.0     3       432 25 4 2
69      427     0.0     3       396 19 10 2
70      386     0.0     3       356 17 9 4
71      349     0.0     3       314 23 6 6
72      312     0.0     3       283 22 3 4
73      257     0.0     3       233 16 5 3
74      215     0.0     3       190 20 3 2
75      169     0.0     3       156 9 3 1
76      111     0.0     3       100 8 1 2
77      95      0.0     3       83 9 2 1
78      82      0.0     3       70 9 2 1
79      78      0.0     3       73 1 3 1
80      30      0.0     3       26 2 2
81      38      0.0     3       33 1 3 1
82      16      0.0     3       15 1
83      19      0.0     3       18 1
84      16      0.0     3       15 0 0 1
85      23      0.0     3       21 1 1
86      7       0.0     3       6 1
87      18      0.0     3       15 2 1
88      12      0.0     3       8 4
89      24      0.0     3       22 2
90      10      0.0     3       9 1
91      17      0.0     3       14 2 1
92      4       0.0     3       4
93      12      0.0     3       11 1
94      12      0.0     3       6 3 0 3
95      13      0.0     3       10 3
96      15      0.0     3       10 2 1 2
97      6       0.0     3       2 2 1 1
98      13      0.0     3       8 2 3
99      5       0.0     3       4 0 1
100     10      0.0     3       1 5 2 2
101     65176   0.0     3       6 58156 6462 552
```
<br>
**Second pair of fastq files (27_4C_mbnl) command:**
```
cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -o 27_4C_mbnl_S19_L008_R1_cutadapt.fq -p 27_4C_mbnl_S19_L008_R2_cutadapt.fq /projects/bgmp/shared/2017_sequencing/demultiplexed/27_4C_mbnl_S19_L008_R1_001.fastq.gz /projects/bgmp/shared/2017_sequencing/demultiplexed/27_4C_mbnl_S19_L008_R2_001.fastq.gz
```
**Summary of results:**
```
=== Summary ===

Total read pairs processed:          7,226,430
  Read 1 with adapter:                 751,117 (10.4%)
  Read 2 with adapter:                 803,568 (11.1%)
Pairs written (passing filters):     7,226,430 (100.0%)

Total basepairs processed: 1,459,738,860 bp
  Read 1:   729,869,430 bp
  Read 2:   729,869,430 bp
Total written (filtered):  1,429,426,877 bp (97.9%)
  Read 1:   714,826,948 bp
  Read 2:   714,599,929 bp

=== First read: Adapter 1 ===

Sequence: AGATCGGAAGAGCACACGTCTGAACTCCAGTCA; Type: regular 3'; Length: 33; Trimmed: 751117 times

Minimum overlap: 3
No. of allowed errors:
1-9 bp: 0; 10-19 bp: 1; 20-29 bp: 2; 30-33 bp: 3

Bases preceding removed adapters:
  A: 14.4%
  C: 28.4%
  G: 41.4%
  T: 14.3%
  none/other: 1.5%

Overview of removed sequences
length  count   expect  max.err error counts
3       139077  112913.0        0       139077
4       41610   28228.2 0       41610
5       23062   7057.1  0       23062
6       17612   1764.3  0       17612
7       16630   441.1   0       16630
8       16318   110.3   0       16318
9       16290   27.6    0       16067 223
10      17031   6.9     1       16356 675
11      16245   1.7     1       15680 565
12      16009   0.4     1       15445 564
13      15877   0.1     1       15289 588
14      15750   0.0     1       15067 683
15      15754   0.0     1       15135 619
16      15534   0.0     1       14818 716
17      15440   0.0     1       14721 719
18      15189   0.0     1       14463 717 9
19      14914   0.0     1       14157 731 26
20      14348   0.0     2       13598 670 80
21      14319   0.0     2       13583 663 73
22      14340   0.0     2       13545 693 102
23      13783   0.0     2       12945 725 113
24      13787   0.0     2       12879 807 101
25      13525   0.0     2       12657 779 89
26      13128   0.0     2       12267 749 112
27      12697   0.0     2       11889 691 110 7
28      12565   0.0     2       11676 762 111 16
29      11924   0.0     2       11033 779 100 12
30      11828   0.0     3       10950 746 96 36
31      11358   0.0     3       10469 732 116 41
32      10890   0.0     3       10052 691 115 32
33      10392   0.0     3       9595 648 114 35
34      10014   0.0     3       9254 625 99 36
35      9464    0.0     3       8763 589 83 29
36      9216    0.0     3       8558 549 70 39
37      8955    0.0     3       8280 589 59 27
38      8572    0.0     3       7942 533 71 26
39      7875    0.0     3       7350 452 51 22
40      7512    0.0     3       6999 440 48 25
41      6960    0.0     3       6439 447 56 18
42      6447    0.0     3       5980 404 46 17
43      5996    0.0     3       5605 341 38 12
44      5335    0.0     3       4989 293 41 12
45      4804    0.0     3       4469 296 33 6
46      4274    0.0     3       3988 243 28 15
47      4028    0.0     3       3743 251 26 8
48      3558    0.0     3       3321 212 19 6
49      3378    0.0     3       3175 178 18 7
50      3035    0.0     3       2847 162 22 4
51      2730    0.0     3       2543 147 38 2
52      2344    0.0     3       2172 153 18 1
53      2072    0.0     3       1926 118 16 12
54      1797    0.0     3       1697 88 9 3
55      1604    0.0     3       1525 68 8 3
56      1392    0.0     3       1292 89 9 2
57      1164    0.0     3       1091 59 12 2
58      1151    0.0     3       1074 68 4 5
59      992     0.0     3       924 56 10 2
60      950     0.0     3       886 58 4 2
61      883     0.0     3       821 47 9 6
62      769     0.0     3       722 41 5 1
63      647     0.0     3       607 32 5 3
64      583     0.0     3       544 32 4 3
65      515     0.0     3       474 36 5
66      472     0.0     3       435 34 3
67      391     0.0     3       370 19 1 1
68      390     0.0     3       369 21
69      361     0.0     3       332 22 3 4
70      328     0.0     3       311 15 1 1
71      305     0.0     3       280 18 6 1
72      258     0.0     3       248 9 1
73      195     0.0     3       176 12 3 4
74      167     0.0     3       158 9
75      122     0.0     3       111 11
76      73      0.0     3       69 3 0 1
77      67      0.0     3       63 4
78      46      0.0     3       43 3
79      42      0.0     3       42
80      26      0.0     3       23 3
81      14      0.0     3       14
82      16      0.0     3       14 2
83      15      0.0     3       13 2
84      10      0.0     3       8 2
85      15      0.0     3       14 1
86      7       0.0     3       5 1 1
87      17      0.0     3       16 1
88      5       0.0     3       4 1
89      15      0.0     3       14 1
90      12      0.0     3       11 1
91      10      0.0     3       9 1
92      6       0.0     3       6
93      4       0.0     3       4
94      2       0.0     3       2
95      3       0.0     3       3
96      4       0.0     3       4
97      1       0.0     3       1
98      7       0.0     3       7
99      5       0.0     3       5
100     2       0.0     3       1 1
101     11462   0.0     3       5 9983 1382 92


=== Second read: Adapter 2 ===

Sequence: AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT; Type: regular 3'; Length: 33; Trimmed: 803568 times

Minimum overlap: 3
No. of allowed errors:
1-9 bp: 0; 10-19 bp: 1; 20-29 bp: 2; 30-33 bp: 3

Bases preceding removed adapters:
  A: 14.7%
  C: 30.0%
  G: 45.1%
  T: 8.7%
  none/other: 1.4%

Overview of removed sequences
length  count   expect  max.err error counts
3       179746  112913.0        0       179746
4       48533   28228.2 0       48533
5       24243   7057.1  0       24243
6       18502   1764.3  0       18502
7       16839   441.1   0       16839
8       16409   110.3   0       16409
9       16509   27.6    0       16247 262
10      17185   6.9     1       16572 613
11      16406   1.7     1       15932 474
12      16131   0.4     1       15744 387
13      15945   0.1     1       15561 384
14      15816   0.0     1       15436 380
15      15824   0.0     1       15348 476
16      15638   0.0     1       15190 448
17      15538   0.0     1       15044 494
18      15282   0.0     1       14674 605 3
19      14967   0.0     1       14442 515 10
20      14401   0.0     2       13781 565 55
21      14356   0.0     2       13734 551 71
22      14385   0.0     2       13772 553 60
23      13841   0.0     2       13280 501 60
24      13826   0.0     2       13119 627 80
25      13568   0.0     2       12914 578 76
26      13171   0.0     2       12504 596 71
27      12735   0.0     2       12127 532 75 1
28      12609   0.0     2       11924 589 96
29      11982   0.0     2       11301 577 96 8
30      11863   0.0     3       11188 542 96 37
31      11395   0.0     3       10737 560 71 27
32      10923   0.0     3       10279 515 106 23
33      10421   0.0     3       9818 508 64 31
34      10060   0.0     3       9454 485 88 33
35      9489    0.0     3       8945 454 65 25
36      9239    0.0     3       8723 422 71 23
37      8968    0.0     3       8464 427 52 25
38      8591    0.0     3       8088 406 62 35
39      7897    0.0     3       7444 367 46 40
40      7549    0.0     3       7132 336 56 25
41      6982    0.0     3       6611 293 54 24
42      6459    0.0     3       6156 243 40 20
43      6011    0.0     3       5679 278 36 18
44      5329    0.0     3       5043 249 24 13
45      4824    0.0     3       4549 228 28 19
46      4287    0.0     3       4051 192 30 14
47      4044    0.0     3       3807 207 17 13
48      3572    0.0     3       3343 192 23 14
49      3395    0.0     3       3182 185 21 7
50      3049    0.0     3       2866 156 18 9
51      2759    0.0     3       2574 155 15 15
52      2361    0.0     3       2225 102 17 17
53      2095    0.0     3       1969 101 9 16
54      1813    0.0     3       1689 96 21 7
55      1617    0.0     3       1521 78 8 10
56      1412    0.0     3       1326 70 10 6
57      1181    0.0     3       1113 50 10 8
58      1169    0.0     3       1095 56 11 7
59      1013    0.0     3       935 69 4 5
60      966     0.0     3       897 57 8 4
61      894     0.0     3       844 40 6 4
62      786     0.0     3       737 40 6 3
63      669     0.0     3       629 31 7 2
64      602     0.0     3       567 23 9 3
65      531     0.0     3       492 29 5 5
66      490     0.0     3       453 30 5 2
67      398     0.0     3       375 19 2 2
68      409     0.0     3       374 28 5 2
69      382     0.0     3       341 28 9 4
70      337     0.0     3       314 15 3 5
71      315     0.0     3       298 15 1 1
72      267     0.0     3       251 12 3 1
73      212     0.0     3       180 27 3 2
74      175     0.0     3       158 13 2 2
75      135     0.0     3       125 8 2
76      80      0.0     3       74 4 0 2
77      81      0.0     3       66 8 6 1
78      49      0.0     3       46 2 1
79      51      0.0     3       43 5 2 1
80      33      0.0     3       28 2 2 1
81      17      0.0     3       15 1 0 1
82      18      0.0     3       16 0 2
83      17      0.0     3       14 1 0 2
84      14      0.0     3       11 1 1 1
85      16      0.0     3       13 2 0 1
86      8       0.0     3       8
87      18      0.0     3       15 2 1
88      7       0.0     3       7
89      18      0.0     3       16 1 0 1
90      12      0.0     3       9 2 1
91      9       0.0     3       8 1
92      6       0.0     3       3 2 1
93      4       0.0     3       3 1
94      2       0.0     3       2
95      4       0.0     3       3 0 0 1
96      4       0.0     3       3 0 1
97      1       0.0     3       1
98      8       0.0     3       4 3 0 1
99      5       0.0     3       2 2 1
100     4       0.0     3       0 1 1 2
101     11360   0.0     3       3 9906 1353 98
```

### Trimmomatic
- We're running Trimmomatic on the files that were processed with cutadapt
```
trimmomatic PE 17_3E_fox_S13_L008_R1_cutadapt.fq 17_3E_fox_S13_L008_R2_cutadapt.fq -baseout 17_3E_fox.fq.gz LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35
```
/projects/bgmp/taro/bioinfo/Bi623/QAA

### FastQC on trimmed reads
```
Command being timed: "fastqc 17_3E_fox_1P.fq.gz 17_3E_fox_2P.fq.gz -o FastQC-run2/"
	User time (seconds): 85.64
	System time (seconds): 3.98
	Percent of CPU this job got: 94%
	Elapsed (wall clock) time (h:mm:ss or m:ss): 1:34.91
	Average shared text size (kbytes): 0
	Average unshared data size (kbytes): 0
	Average stack size (kbytes): 0
	Average total size (kbytes): 0
	Maximum resident set size (kbytes): 301316
	Average resident set size (kbytes): 0
	Major (requiring I/O) page faults: 321
	Minor (reclaiming a frame) page faults: 69911
	Voluntary context switches: 6647
	Involuntary context switches: 2889
	Swaps: 0
	File system inputs: 63040
	File system outputs: 5040
	Socket messages sent: 0
	Socket messages received: 0
	Signals delivered: 0
	Page size (bytes): 4096
	Exit status: 0
```

```
Command being timed: "fastqc 27_4C_mbnl_1P.fq.gz 27_4C_mbnl_2P.fq.gz -o FastQC-run2/"
	User time (seconds): 51.85
	System time (seconds): 2.51
	Percent of CPU this job got: 96%
	Elapsed (wall clock) time (h:mm:ss or m:ss): 0:56.53
	Average shared text size (kbytes): 0
	Average unshared data size (kbytes): 0
	Average stack size (kbytes): 0
	Average total size (kbytes): 0
	Maximum resident set size (kbytes): 297716
	Average resident set size (kbytes): 0
	Major (requiring I/O) page faults: 0
	Minor (reclaiming a frame) page faults: 65079
	Voluntary context switches: 3697
	Involuntary context switches: 2123
	Swaps: 0
	File system inputs: 0
	File system outputs: 4800
	Socket messages sent: 0
	Socket messages received: 0
	Signals delivered: 0
	Page size (bytes): 4096
	Exit status: 0
```

## Part 3: Alignment and strand-specificity
Software I installed in QAA environment:
- star (version 2.7.11b)
- numpy (version 1.26.4) --> had to be downgraded to install htseq
- matplotlib
-  htseq (version 2.0.5)

### Generating database
For my reference genome, I used mouse genome fasta and gtf files from ensemble release 112.  I generated the alignment database using my `STAR-db.sh` sbatch script. Time results (job #16037106):
```
	Command being timed: "STAR --runThreadN 8 --runMode genomeGenerate --genomeDir Mus_musculus.GRCm39.dna.ens112.STAR_2.7.11b/ --genomeFastaFiles genome-files/Mus_musculus.GRCm39.dna.primary_assembly.fa --sjdbGTFfile genome-files/Mus_musculus.GRCm39.112.gtf"
	User time (seconds): 4719.93
	System time (seconds): 52.42
	Percent of CPU this job got: 496%
	Elapsed (wall clock) time (h:mm:ss or m:ss): 16:00.24
	Average shared text size (kbytes): 0
	Average unshared data size (kbytes): 0
	Average stack size (kbytes): 0
	Average total size (kbytes): 0
	Maximum resident set size (kbytes): 32370456
	Average resident set size (kbytes): 0
	Major (requiring I/O) page faults: 0
	Minor (reclaiming a frame) page faults: 24936283
	Voluntary context switches: 19658
	Involuntary context switches: 8153
	Swaps: 0
	File system inputs: 0
	File system outputs: 0
	Socket messages sent: 0
	Socket messages received: 0
	Signals delivered: 0
	Page size (bytes): 4096
	Exit status: 0
```

### Align reads to database
I aligned my paired trimmed reads for both libraries to the mouse reference genome using the script `align-reads.sh`. 

**Time results for first library (17-3E-fox) (job #16037131):**
```
Command being timed: "STAR --runThreadN 8 --runMode alignReads --outFilterMultimapNmax 3 --outSAMunmapped Within KeepPairs --alignIntronMax 1000000 --alignMatesGapMax 1000000 --readFilesCommand zcat --readFilesIn 17_3E_fox_1P.fq.gz 17_3E_fox_2P.fq.gz --genomeDir Mus_musculus.GRCm39.dna.ens112.STAR_2.7.11b/ --outFileNamePrefix 17-3E-fox_alignment"
	User time (seconds): 563.02
	System time (seconds): 12.97
	Percent of CPU this job got: 509%
	Elapsed (wall clock) time (h:mm:ss or m:ss): 1:53.15
	Average shared text size (kbytes): 0
	Average unshared data size (kbytes): 0
	Average stack size (kbytes): 0
	Average total size (kbytes): 0
	Maximum resident set size (kbytes): 27467668
	Average resident set size (kbytes): 0
	Major (requiring I/O) page faults: 2
	Minor (reclaiming a frame) page faults: 1194467
	Voluntary context switches: 83568
	Involuntary context switches: 2894
	Swaps: 0
	File system inputs: 56
	File system outputs: 0
	Socket messages sent: 0
	Socket messages received: 0
	Signals delivered: 0
	Page size (bytes): 4096
	Exit status: 0
```

**Time results for second library (27-4C-mbnl) (job #16037136):**
```
Command being timed: "STAR --runThreadN 8 --runMode alignReads --outFilterMultimapNmax 3 --outSAMunmapped Within KeepPairs --alignIntronMax 1000000 --alignMatesGapMax 1000000 --readFilesCommand zcat --readFilesIn 27_4C_mbnl_1P.fq.gz 27_4C_mbnl_2P.fq.gz --genomeDir Mus_musculus.GRCm39.dna.ens112.STAR_2.7.11b/ --outFileNamePrefix 27-4C-mbnl"
	User time (seconds): 324.90
	System time (seconds): 14.17
	Percent of CPU this job got: 414%
	Elapsed (wall clock) time (h:mm:ss or m:ss): 1:21.79
	Average shared text size (kbytes): 0
	Average unshared data size (kbytes): 0
	Average stack size (kbytes): 0
	Average total size (kbytes): 0
	Maximum resident set size (kbytes): 27376268
	Average resident set size (kbytes): 0
	Major (requiring I/O) page faults: 0
	Minor (reclaiming a frame) page faults: 1612196
	Voluntary context switches: 50689
	Involuntary context switches: 1931
	Swaps: 0
	File system inputs: 0
	File system outputs: 0
	Socket messages sent: 0
	Socket messages received: 0
	Signals delivered: 0
	Page size (bytes): 4096
	Exit status: 0
```

### Parse SAM files
I printed the number of mapped and unmapped reads in each SAM file that was outputted by STAR using `SAM-parsing.py`.
<br>
**First library:**
`./SAM-parsing.py -f 17-3E-fox_alignmentAligned.out.sam`<br>
Output:<br>
Number of mapped: 21532811
Number of unmapped: 948721
<br>
**Second library:**
`./SAM-parsing.py -f 27-4C-mbnlAligned.out.sam`<br>
Output:<br>
Number of mapped: 13320032
Number of unmapped: 433878

- [ ] IMPROVE FIGURE CAPTIONS
- [ ] ADD WHICH ENSEMBL FILES YOU USED

### htseq counts
#### Time results
**17-3E-fox**
```
	Command being timed: "htseq-count 17-3E-fox_alignmentAligned.out.sam genome-files/Mus_musculus.GRCm39.112.gtf --stranded yes"
	User time (seconds): 883.80
	System time (seconds): 5.53
	Percent of CPU this job got: 98%
	Elapsed (wall clock) time (h:mm:ss or m:ss): 14:58.33
	Average shared text size (kbytes): 0
	Average unshared data size (kbytes): 0
	Average stack size (kbytes): 0
	Average total size (kbytes): 0
	Maximum resident set size (kbytes): 253140
	Average resident set size (kbytes): 0
	Major (requiring I/O) page faults: 0
	Minor (reclaiming a frame) page faults: 56319
	Voluntary context switches: 1398
	Involuntary context switches: 2203
	Swaps: 0
	File system inputs: 0
	File system outputs: 0
	Socket messages sent: 0
	Socket messages received: 0
	Signals delivered: 0
	Page size (bytes): 4096
	Exit status: 0
```

```
	Command being timed: "htseq-count 17-3E-fox_alignmentAligned.out.sam genome-files/Mus_musculus.GRCm39.112.gtf --stranded reverse"
	User time (seconds): 878.07
	System time (seconds): 5.54
	Percent of CPU this job got: 99%
	Elapsed (wall clock) time (h:mm:ss or m:ss): 14:49.14
	Average shared text size (kbytes): 0
	Average unshared data size (kbytes): 0
	Average stack size (kbytes): 0
	Average total size (kbytes): 0
	Maximum resident set size (kbytes): 252780
	Average resident set size (kbytes): 0
	Major (requiring I/O) page faults: 0
	Minor (reclaiming a frame) page faults: 54922
	Voluntary context switches: 273
	Involuntary context switches: 3065
	Swaps: 0
	File system inputs: 0
	File system outputs: 0
	Socket messages sent: 0
	Socket messages received: 0
	Signals delivered: 0
	Page size (bytes): 4096
	Exit status: 0
```


**27-4C-mbnl**

```
	Command being timed: "htseq-count 27-4C-mbnlAligned.out.sam genome-files/Mus_musculus.GRCm39.112.gtf --stranded yes"
	User time (seconds): 554.01
	System time (seconds): 2.11
	Percent of CPU this job got: 99%
	Elapsed (wall clock) time (h:mm:ss or m:ss): 9:20.94
	Average shared text size (kbytes): 0
	Average unshared data size (kbytes): 0
	Average stack size (kbytes): 0
	Average total size (kbytes): 0
	Maximum resident set size (kbytes): 253116
	Average resident set size (kbytes): 0
	Major (requiring I/O) page faults: 0
	Minor (reclaiming a frame) page faults: 56605
	Voluntary context switches: 1409
	Involuntary context switches: 1434
	Swaps: 0
	File system inputs: 0
	File system outputs: 0
	Socket messages sent: 0
	Socket messages received: 0
	Signals delivered: 0
	Page size (bytes): 4096
	Exit status: 0
```

```
	Command being timed: "htseq-count 27-4C-mbnlAligned.out.sam genome-files/Mus_musculus.GRCm39.112.gtf --stranded reverse"
	User time (seconds): 565.31
	System time (seconds): 2.11
	Percent of CPU this job got: 99%
	Elapsed (wall clock) time (h:mm:ss or m:ss): 9:29.95
	Average shared text size (kbytes): 0
	Average unshared data size (kbytes): 0
	Average stack size (kbytes): 0
	Average total size (kbytes): 0
	Maximum resident set size (kbytes): 252524
	Average resident set size (kbytes): 0
	Major (requiring I/O) page faults: 0
	Minor (reclaiming a frame) page faults: 54745
	Voluntary context switches: 263
	Involuntary context switches: 1672
	Swaps: 0
	File system inputs: 0
	File system outputs: 0
	Socket messages sent: 0
	Socket messages received: 0
	Signals delivered: 0
	Page size (bytes): 4096
	Exit status: 0
```

#### Determine strandedness
To determine whether my libraries were strand-specific, I used the bash commands from ICA4 to calculate the percentage of reads that mapped to features in these htseq count files. 

**17-3E-fox**
```
grep -v "^__" 17_3E_fox_fw.counts | awk '{sum+=$2} END {print sum}'
grep -v "^__" 17_3E_fox_rv.counts | awk '{sum+=$2} END {print sum}'

Number of reads mapped, fw: 414546
Number of reads mapped, rv: 8951364
```

Total number of reads:
```
awk '{sum+=$2} END {print sum}' 17_3E_fox_fw.counts
awk '{sum+=$2} END {print sum}' 17_3E_fox_rv.counts

Total reads, fw: 11240766
Total reads, rv: 11240766
```

Percentage of mapped reads:
```
Percent of reads mapped, fw: 3.69%
Percent of reads mapped, rv: 79.63%
```

**27-4C-mbnl**
```
Number of reads mapped, fw: 269097
Number of reads mapped, rv: 5687311

Total number of reads, fw: 6876955
Total number of reads, rv: 6876955

Percentage of mapped reads, fw: 3.91%
Percentage of mapped reads, rv: 82.7%
```