#!/bin/bash 
#SOD1_rescue
##samtools merge SOD1_rescue.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2879/SOD1_rescue_R1_130249_CTCTCTAC_S8_R1_001_STAR_OUTPUT/Aligned.sortedByCoord.out.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2879/SOD1_rescue_R2_130250_CGAGGCTG_S9_R1_001_STAR_OUTPUT/Aligned.sortedByCoord.out.bam
#samtools index SOD1_rescue.bam
bamCoverage -b SOD1_rescue.bam -o SOD1_rescue.bigwig -bs=1 --normalizeUsing RPKM -p=5
