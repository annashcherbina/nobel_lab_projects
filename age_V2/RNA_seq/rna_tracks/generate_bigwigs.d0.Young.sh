#!/bin/bash
#d0_Young
##samtools merge d0_Young.RNA.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2081/MuSC_d0_Y_Rep1_STAR_OUTPUT/Aligned.sortedByCoord.out.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2081/MuSC_d0_Y_Rep2_STAR_OUTPUT/Aligned.sortedByCoord.out.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2081/MuSC_d0_Y_Rep3_STAR_OUTPUT/Aligned.sortedByCoord.out.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2081/MuSC_d0_Y_STAR_OUTPUT/Aligned.sortedByCoord.out.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2879/D0_Young_WT_R1_130242_TAAGGCGA_S1_R1_001_STAR_OUTPUT/Aligned.sortedByCoord.out.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2879/D0_Young_WT_R2_130243_CGTACTAG_S2_R1_001_STAR_OUTPUT/Aligned.sortedByCoord.out.bam
#samtools index d0_Young.RNA.bam 
bamCoverage -b d0_Young.RNA.bam -o d0_Young.RNA.bigwig -bs=1 --normalizeUsing RPKM -p=5
