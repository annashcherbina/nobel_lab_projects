#!/bin/bash
prefix='/nas/homes/annashch/H4K20me1'
~/TrimGalore-0.6.5/trim_galore --paired -q 30 --nextera $prefix/Old-H4K20me1-1_R1_001.fastq.gz $prefix/Old-H4K20me1-1_R2_001.fastq.gz -o $prefix/Old-H4K20me1-1 &
~/TrimGalore-0.6.5/trim_galore --paired -q 30 --nextera $prefix/Old-H4K20me1-2_R1_001.fastq.gz $prefix/Old-H4K20me1-2_R2_001.fastq.gz -o $prefix/Old-H4K20me1-2 &
~/TrimGalore-0.6.5/trim_galore --paired -q 30 --nextera $prefix/Old-H4K20me1-3_R1_001.fastq.gz $prefix/Old-H4K20me1-3_R2_001.fastq.gz -o $prefix/Old-H4K20me1-3 &
~/TrimGalore-0.6.5/trim_galore --paired -q 30 --nextera $prefix/Young-H4K20me1-1_R1_001.fastq.gz $prefix/Young-H4K20me1-1_R2_001.fastq.gz -o $prefix/Young-H4K20me1-1 &
~/TrimGalore-0.6.5/trim_galore --paired -q 30 --nextera $prefix/Young-H4K20me1-2_R1_001.fastq.gz $prefix/Young-H4K20me1-2_R2_001.fastq.gz -o $prefix/Young-H4K20me1-2 &
~/TrimGalore-0.6.5/trim_galore --paired -q 30 --nextera $prefix/Young-H4K20me1-3_R1_001.fastq.gz $prefix/Young-H4K20me1-3_R2_001.fastq.gz -o $prefix/Young-H4K20me1-3 &

