#!/bin/bash
samtools merge d0_Aged.RNA.bam \
	 /nas/homes/annashch/Age_RNASeq/Run_2200/MuSC_d0_Old_16K_R1R2_STAR_OUTPUT/Aligned.sortedByCoord.out.bam \
	 /nas/homes/annashch/Age_RNASeq/Run_2081/MuSC_d0_Old_STAR_OUTPUT/Aligned.sortedByCoord.out.bam \
	 /nas/homes/annashch/Age_RNASeq/Run_2249/MuSC_d0_Old_16K_STAR_OUTPUT/Aligned.sortedByCoord.out.bam \
	 /nas/homes/annashch/Age_RNASeq/Run_2830/D0_old_1_128862_TAAGGCGA-ATAGAGAG_S1_R1_001_STAR_OUTPUT/Aligned.sortedByCoord.out.bam \
	 /nas/homes/annashch/Age_RNASeq/Run_2830/D0_old_2_128863_TAAGGCGA-AGAGGATA_S2_R1_001_STAR_OUTPUT/Aligned.sortedByCoord.out.bam
samtools index d0_Aged.RNA.bam
bamCoverage -b d0_Aged.RNA.bam -o d0_Aged.RNA.bigwig -bs=1 --normalizeUsing RPKM -p=5
