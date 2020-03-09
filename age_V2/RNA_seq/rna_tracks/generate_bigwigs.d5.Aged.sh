#!/bin/bash 
#d5_Aged 
##samtools merge d5_Aged.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2200/MuSC_d5_Old_40K_R1_STAR_OUTPUT/Aligned.sortedByCoord.out.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2081/MuSC_d5_Old_STAR_OUTPUT/Aligned.sortedByCoord.out.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2249/MuSC_d5_Old_40K_STAR_OUTPUT/Aligned.sortedByCoord.out.bam
#samtools index d5_Aged.bam 
bamCoverage -b d5_Aged.bam -o d5_Aged.bigwig -bs=1 --normalizeUsing RPKM -p=5 
