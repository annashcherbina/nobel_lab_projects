#!/bin/bash
peaks=/mnt/lab_data2/annashch/nobel_lab_projects/age_V2/ATAC_seq/footprints/myod/intersection.neg.pos.aggregate.bed
for sample in d1_Aged d1_Young #d0_Aged d0_Young d1_Aged d1_Young d3_Aged d3_Young d5_Aged d5_Young d7_Aged d7_Young
do    
    TOBIAS ATACorrect --bam ../../tracks/merged_bams/$sample.merged.bam --genome /mnt/data/mm10_no_alt_analysis_set_ENCODE.fasta --peaks $peaks --cores 50 --prefix $sample &
done
