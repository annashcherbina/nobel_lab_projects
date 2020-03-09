#!/bin/bash 
#d5_Young
##samtools merge d5_Young.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2200/MuSC_d5_Y_32K_R1_STAR_OUTPUT/Aligned.sortedByCoord.out.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2249/MuSC_d5_Y_32K_R1_STAR_OUTPUT/Aligned.sortedByCoord.out.bam
#samtools index d5_Young.bam
bamCoverage -b d5_Young.bam -o d5_Young.bigwig -bs=1 --normalizeUsing RPKM -p=5
