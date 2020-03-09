#!/usr/bin/env bash
#RUN 2879
export prefix=/home/annashch/nas/Age_RNASeq
for sample in D0_Young_Pax7_R1_130246_GGACTCCT_S5_R1_001 D0_Young_WT_R1_130242_TAAGGCGA_S1_R1_001 D7_Young_WT_R2_130245_TCCTGAGC_S4_R1_001 D0_Young_Pax7_R3_130247_TAGGCATG_S6_R1_001 D0_Young_WT_R2_130243_CGTACTAG_S2_R1_001 SOD1_rescue_R1_130249_CTCTCTAC_S8_R1_001 D0_Young_Pax7_R4_130248_GTAGAGGA_S7_R1_001 D7_Young_WT_R1_130244_AGGCAGAA_S3_R1_001 SOD1_rescue_R2_130250_CGAGGCTG_S9_R1_001
do
    mkdir $prefix/Run_2879/$sample\_STAR_OUTPUT/
    /opt/rna_seq_pipeline/map_rna_star_single_end.sh --R1 $prefix/Run_2879/$sample.fastq.gz --starGenomeDir  /data/mm10/star --ncpus 10 --outputbase $prefix/Run_2879/$sample\_STAR_OUTPUT/ 
    mkdir $prefix/Run_2879/$sample\_RSEM_OUTPUT/
    mkdir $prefix/Run_2879/$sample\_RSEM_OUTPUT/rsem.quant.stat    
    /opt/rna_seq_pipeline/quant_rna_rsem_single_end.sh --transcriptBAM $prefix/Run_2879/$sample\_STAR_OUTPUT/Aligned.toTranscriptome.out.bam --output $prefix/Run_2879/$sample\_RSEM_OUTPUT --rsemGenomeDir /data/mm10/rsem/rsem --ncpus 10
done
    
