#!/usr/bin/env bash

#RUN 2278
#for sample in MuSC_d0_WT_16K_R2 MuSC_d21_S_KO_20K_R2 MuSC_d7_Old_5K_R1 MuSC_d7_Old_5K_R1 MuSC_d0_S_K0_17K_R2 MuSC_d1_Old_10K_R1 MuSC_d21_S_KO_25K_R1 MuSC_d0_S_KO_17K_R1 MuSC_d1_Old_16K_R2  MuSC_d0_WT_16K_R1 MuSC_d1_Y_10K_R2 MuSC_d21_WT_34K_R2

#RUN 2200 
#for sample in MuSC_d0_Old_16K_R1R2 MuSC_d1_Y_21K_R1 MuSC_d3_Y_38K_R1 MuSC_dO_Y_1K_R2 MuSC_d0_Y_19K_R1 MuSC_d1_Y_32K_R1 MuSC_d5_Old_40K_R1 MuSC_d0_Y_53K_R1 MuSC_d2_Y_19K_R1 MuSC_d5_Y_32K_R1
#do
#    mkdir Run_2200/$sample\_STAR_OUTPUT/    
#    /opt/rna_seq_pipeline/map_rna_star_single_end.sh --R1 nas/Age_RNASeq/Run_2200/$sample.fastq.gz  --starGenomeDir /data/mm10/star --ncpus 40 --outputbase Run_2200/$sample\_STAR_OUTPUT/ 
#    mkdir Run_2200/$sample\_RSEM_OUTPUT/
#    /opt/rna_seq_pipeline/quant_rna_rsem_single_end.sh --transcriptBAM Run_2200/$sample\_STAR_OUTPUT/Aligned.toTranscriptome.out.bam --output Run_2200/$sample\_RSEM_OUTPUT --rsemGenomeDir /data/mm10/rsem/rsem --ncpus 40
#done

#RUN 2249
#for sample in MuSC_d0_Old_16K MuSC_d1_Y_10K_R2 MuSC_d5_Old_40K MuSC_d7_Y_5K_R1 MuSC_d0_Y_53K_R1 MuSC_d3_Old_40K_R1 MuSC_d5_Y_32K_R1 MuSC_d7_Y_5K_R2 MuSC_d1_Y_10K_R1 MuSC_d3_Y_38K_R1 MuSC_d7_Old_5K_R2
#do
#    mkdir Run_2249/$sample\_STAR_OUTPUT/
#    /opt/rna_seq_pipeline/map_rna_star_single_end.sh --R1 nas/Age_RNASeq/Run_2249/$sample.fastq.gz --starGenomeDir  /data/mm10/star --ncpus 40 --outputbase Run_2249/$sample\_STAR_OUTPUT/ 
#    mkdir Run_2249/$sample\_RSEM_OUTPUT/
#    /opt/rna_seq_pipeline/quant_rna_rsem_single_end.sh --transcriptBAM Run_2249/$sample\_STAR_OUTPUT/Aligned.toTranscriptome.out.bam --output Run_2249/$sample\_RSEM_OUTPUT --rsemGenomeDir /data/mm10/rsem/rsem --ncpus 40
#done

export prefix=/home/annashch/nas/Age_RNASeq
#RUN 2830 
for sample in D0_old_1_128862_TAAGGCGA-ATAGAGAG_S1_R1_001  D3_young1_128868_TAAGGCGA-ATTAGACG_S7_R1_001  SOD1_KO_1_CGTACTAG-AGAGGATA_S9_R1_001 D0_old_2_128863_TAAGGCGA-AGAGGATA_S2_R1_001  D3_young2_128869_TAAGGCGA-CGGAGAGA_S8_R1_001  SOD1_KO_2_128871_CGTACTAG-TATGCAGT_S10_R1_001 D3_old_1_128864_TAAGGCGA-CTCCTTAC_S3_R1_001  D7_old_1_128866_TAAGGCGA-TACTCCTT_S5_R1_001 D3_old_2_128865_TAAGGCGA-TATGCAGT_S4_R1_001  D7_old_2_128867_TAAGGCGA-AGGCTTAG_S6_R1_001      
do
    mkdir $prefix/Run_2830/$sample\_STAR_OUTPUT/
    /opt/rna_seq_pipeline/map_rna_star_single_end.sh --R1 $prefix/Run_2830/$sample.fastq.gz --starGenomeDir  /data/mm10/star --ncpus 10 --outputbase $prefix/Run_2830/$sample\_STAR_OUTPUT/ 
    mkdir $prefix/Run_2830/$sample\_RSEM_OUTPUT/
    mkdir $prefix/Run_2830/$sample\_RSEM_OUTPUT/rsem.quant.stat
    /opt/rna_seq_pipeline/quant_rna_rsem_single_end.sh --transcriptBAM $prefix/Run_2830/$sample\_STAR_OUTPUT/Aligned.toTranscriptome.out.bam --output $prefix/Run_2830/$sample\_RSEM_OUTPUT --rsemGenomeDir /data/mm10/rsem/rsem --ncpus 10
done

#RUN 2879
#for sample in D0_Young_Pax7_R1_130246_GGACTCCT_S5_R1_001 D0_Young_WT_R1_130242_TAAGGCGA_S1_R1_001 D7_Young_WT_R2_130245_TCCTGAGC_S4_R1_001 D0_Young_Pax7_R3_130247_TAGGCATG_S6_R1_001 D0_Young_WT_R2_130243_CGTACTAG_S2_R1_001 SOD1_rescue_R1_130249_CTCTCTAC_S8_R1_001 D0_Young_Pax7_R4_130248_GTAGAGGA_S7_R1_001 D7_Young_WT_R1_130244_AGGCAGAA_S3_R1_001 SOD1_rescue_R2_130250_CGAGGCTG_S9_R1_001
#do
#    mkdir $prefix/Run_2879/$sample\_STAR_OUTPUT/
#    /opt/rna_seq_pipeline/map_rna_star_single_end.sh --R1 $prefix/Run_2879/$sample.fastq.gz --starGenomeDir  /data/mm10/star --ncpus 20 --outputbase $prefix/Run_2879/$sample\_STAR_OUTPUT/ 
#    mkdir $prefix/Run_2879/$sample\_RSEM_OUTPUT/
#    /opt/rna_seq_pipeline/quant_rna_rsem_single_end.sh --transcriptBAM $prefix/Run_2879/$sample\_STAR_OUTPUT/Aligned.toTranscriptome.out.bam --output $prefix/Run_2879/$sample\_RSEM_OUTPUT --rsemGenomeDir /data/mm10/rsem/rsem --ncpus 20
#done
    
