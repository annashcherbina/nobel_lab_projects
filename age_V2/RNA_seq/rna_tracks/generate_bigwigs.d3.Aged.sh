#!/bin/bash 
#d3_Aged 
##samtools merge d3_Aged.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2081/MuSC_d3_Old_STAR_OUTPUT/Aligned.sortedByCoord.out.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2249/MuSC_d3_Old_40K_R1_STAR_OUTPUT/Aligned.sortedByCoord.out.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2830/D3_old_1_128864_TAAGGCGA-CTCCTTAC_S3_R1_001_STAR_OUTPUT/Aligned.sortedByCoord.out.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2830/D3_old_2_128865_TAAGGCGA-TATGCAGT_S4_R1_001_STAR_OUTPUT/Aligned.sortedByCoord.out.bam
#samtools index d3_Aged.bam
bamCoverage -b d3_Aged.bam -o d3_Aged.bigwig -bs=1 --normalizeUsing RPKM -p=5 
