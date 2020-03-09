#!/bin/bash
#d7_Aged 
##samtools merge d7_Aged.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2249/MuSC_d7_Old_5K_R2_STAR_OUTPUT/Aligned.sortedByCoord.out.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2278/MuSC_d7_Old_5K_R1_STAR_OUTPUT/Aligned.sortedByCoord.out.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2830/D7_old_1_128866_TAAGGCGA-TACTCCTT_S5_R1_001_STAR_OUTPUT/Aligned.sortedByCoord.out.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2830/D7_old_2_128867_TAAGGCGA-AGGCTTAG_S6_R1_001_STAR_OUTPUT/Aligned.sortedByCoord.out.bam
#samtools index d7_Aged.bam 
bamCoverage -b d7_Aged.bam -o d7_Aged.bigwig -bs=1 --normalizeUsing RPKM -p=5
