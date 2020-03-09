#!/bin/bash
#d1_Aged
#samtools merge d1_Aged.bam \
	 /nas/homes/annashch/Age_RNASeq/Run_2278/MuSC_d1_Old_10K_R1_STAR_OUTPUT/Aligned.sortedByCoord.out.bam \
	 /nas/homes/annashch/Age_RNASeq/Run_2278/MuSC_d1_Old_16K_R2_STAR_OUTPUT/Aligned.sortedByCoord.out.bam
#samtools index d1_Aged.bam 
bamCoverage -b d1_Aged.bam -o d1_Aged.bigwig -bs=1 --normalizeUsing RPKM -p=5
