#!/bin/bash
#d0_Young_Pax7
##samtools merge d0_Young_Pax7.RNA.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2879/D0_Young_Pax7_R3_130247_TAGGCATG_S6_R1_001_STAR_OUTPUT/Aligned.sortedByCoord.out.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2879/D0_Young_Pax7_R4_130248_GTAGAGGA_S7_R1_001_STAR_OUTPUT/Aligned.sortedByCoord.out.bam \
#	 /nas/homes/annashch/Age_RNASeq/Run_2879/D0_Young_Pax7_R1_130246_GGACTCCT_S5_R1_001_STAR_OUTPUT/Aligned.sortedByCoord.out.bam
#samtools index d0_Young_Pax7.RNA.bam
bamCoverage -b d0_Young_Pax7.RNA.bam -o d0_Young_Pax7.RNA.bigwig -bs=1 --normalizeUsing RPKM -p=5
