#!/bin/bash
#run trimommatic with Nextera adapters on day 21 samples
sample_prefix=/nas/datasets/BOX/Aging/RNA-Seq/902-JL
samples=(space d21_old_R1 d21_old_R2 d21_young_R1 d21_young_R2 d21_young_R3) 
for i in 1 `seq 1 5`
do
    outf=${samples[$i]}.trimmed.fastq.gz
    echo $outf
    ./trim_rna_trimmomatic_SE.sh --R1 $sample_prefix/Sample_902-JL-$i/*gz --output $outf --readLength 36 --ncpus 50 
done
	
