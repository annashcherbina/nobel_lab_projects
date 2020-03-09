#!/bin/bash 
#d7_Young
##samtools merge d7_Young.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2249/MuSC_d7_Y_5K_R1_STAR_OUTPUT/Aligned.sortedByCoord.out.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2249/MuSC_d7_Y_5K_R2_STAR_OUTPUT/Aligned.sortedByCoord.out.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2879/D7_Young_WT_R2_130245_TCCTGAGC_S4_R1_001_STAR_OUTPUT/Aligned.sortedByCoord.out.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2879/D7_Young_WT_R1_130244_AGGCAGAA_S3_R1_001_STAR_OUTPUT/Aligned.sortedByCoord.out.bam
#samtools index d7_Young.bam
bamCoverage -b d7_Young.bam -o d7_Aged.bigwig -bs=1 --normalizeUsing RPKM -p=5
