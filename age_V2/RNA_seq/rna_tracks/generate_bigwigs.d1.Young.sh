#!/bin/bash
#d1_Young 
#samtools merge d1_Young.bam \
	 /nas/homes/annashch/Age_RNASeq/Run_2081/MuSC_d1_Y_STAR_OUTPUT/Aligned.sortedByCoord.out.bam \
	 /nas/homes/annashch/Age_RNASeq/Run_2249/MuSC_d1_Y_10K_R1_STAR_OUTPUT/Aligned.sortedByCoord.out.bam \
	 /nas/homes/annashch/Age_RNASeq/Run_2249/MuSC_d1_Y_10K_R2_STAR_OUTPUT/Aligned.sortedByCoord.out.bam \
	 /nas/homes/annashch/Age_RNASeq/Run_2278/MuSC_d1_Y_10K_R2_STAR_OUTPUT/Aligned.sortedByCoord.out.bam
#samtools index d1_Young.bam
bamCoverage -b d1_Young.bam -o d1_Young.bigwig -bs=1 --normalizeUsing RPKM -p=5 
