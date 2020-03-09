#!/bin/bash 
#d3_Young 
##samtools merge d3_Young.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2200/MuSC_d3_Y_38K_R1_STAR_OUTPUT/Aligned.sortedByCoord.out.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2081/MuSC_d3_Y_STAR_OUTPUT/Aligned.sortedByCoord.out.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2249/MuSC_d3_Y_38K_R1_STAR_OUTPUT/Aligned.sortedByCoord.out.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2830/D3_young1_128868_TAAGGCGA-ATTAGACG_S7_R1_001_STAR_OUTPUT/Aligned.sortedByCoord.out.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2830/D3_young2_128869_TAAGGCGA-CGGAGAGA_S8_R1_001_STAR_OUTPUT/Aligned.sortedByCoord.out.bam
#samtools index d3_Young.bam 
bamCoverage -b d3_Young.bam -o d3_Young.bigwig -bs=1 --normalizeUsing RPKM -p=5 
