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
for sample in MuSC_d0_Old_16K MuSC_d1_Y_10K_R2 MuSC_d5_Old_40K MuSC_d7_Y_5K_R1 MuSC_d0_Y_53K_R1 MuSC_d3_Old_40K_R1 MuSC_d5_Y_32K_R1 MuSC_d7_Y_5K_R2 MuSC_d1_Y_10K_R1 MuSC_d3_Y_38K_R1 MuSC_d7_Old_5K_R2
do
    mkdir Run_2249/$sample\_STAR_OUTPUT/
    /opt/rna_seq_pipeline/map_rna_star_single_end.sh --R1 nas/Age_RNASeq/Run_2249/$sample.fastq.gz --starGenomeDir  /data/mm10/star --ncpus 40 --outputbase Run_2249/$sample\_STAR_OUTPUT/ 
    mkdir Run_2249/$sample\_RSEM_OUTPUT/
    /opt/rna_seq_pipeline/quant_rna_rsem_single_end.sh --transcriptBAM Run_2249/$sample\_STAR_OUTPUT/Aligned.toTranscriptome.out.bam --output Run_2249/$sample\_RSEM_OUTPUT --rsemGenomeDir /data/mm10/rsem/rsem --ncpus 40
done
