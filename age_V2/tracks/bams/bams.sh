#d0 Old "chr1:63650000-63730000" > output.bam 
samtools view -b /nas/homes/annashch/Age_ATAC/caper_out/atac/eec6c6aa-e49b-4752-8b9b-b11c90b432fb/call-bowtie2/shard-0/execution/MuSC_d0_Old_10K_R2_r1.merged.bam "chr1:63650000-63730000" > d0_Aged_Rep1.bam
samtools view -b /nas/homes/annashch/Age_ATAC/caper_out/atac/eec6c6aa-e49b-4752-8b9b-b11c90b432fb/call-bowtie2/shard-1/execution/MuSC_d0_Old_10K_R3_r1.merged.bam "chr1:63650000-63730000" > d0_Aged_Rep2.bam
samtools view -b /nas/homes/annashch/Age_ATAC/caper_out/atac/eec6c6aa-e49b-4752-8b9b-b11c90b432fb/call-bowtie2/shard-2/execution/MuSC_d0_Old_10K_R1_r1.merged.bam "chr1:63650000-63730000" > d0_Aged_Rep3.bam 
samtools view -b /nas/homes/annashch/Age_ATAC/caper_out/atac/eec6c6aa-e49b-4752-8b9b-b11c90b432fb/call-bowtie2/shard-3/execution/MuSC_d0_Old_21K_R1_r1.merged.bam "chr1:63650000-63730000" > d0_Aged_Rep4.bam 
samtools view -b /nas/homes/annashch/Age_ATAC/caper_out/atac/eec6c6aa-e49b-4752-8b9b-b11c90b432fb/call-bowtie2/shard-4/execution/D0_Old_MuSC_AGGCAGAA_S3_R1_001.merged.bam "chr1:63650000-63730000" > d0_Aged_Rep5.bam
samtools view -b /nas/homes/annashch/Age_ATAC/caper_out/atac/eec6c6aa-e49b-4752-8b9b-b11c90b432fb/call-bowtie2/shard-5/execution/D0_Old_MuSC_R1_129772_TAGGCATG_S6_R1_001.merged.bam "chr1:63650000-63730000" > d0_Aged_Rep6.bam 
samtools view -b /nas/homes/annashch/Age_ATAC/caper_out/atac/eec6c6aa-e49b-4752-8b9b-b11c90b432fb/call-bowtie2/shard-6/execution/D0_Old_MuSC_R2_129772_CTCTCTAC_S7_R1_001.merged.bam "chr1:63650000-63730000" > d0_Aged_Rep7.bam 


#d0 Young "chr1:63650000-63730000" > output.bam 
samtools view -b /nas/homes/annashch/Age_ATAC/outputs/d0_Young/cromwell-executions/atac/e373e737-4927-458b-b2cb-023ed08dd76e/call-bowtie2/shard-0/execution/MuSC_d0_Y_10K_R1_r1.merged.bam "chr1:63650000-63730000" > d0_Young_Rep1.bam 
samtools view -b /nas/homes/annashch/Age_ATAC/outputs/d0_Young/cromwell-executions/atac/e373e737-4927-458b-b2cb-023ed08dd76e/call-bowtie2/shard-1/execution/MuSC_d0_Y_10K_R2_r1.merged.bam "chr1:63650000-63730000" > d0_Young_Rep2.bam 
samtools view -b /nas/homes/annashch/Age_ATAC/outputs/d0_Young/cromwell-executions/atac/e373e737-4927-458b-b2cb-023ed08dd76e/call-bowtie2/shard-2/execution/MuSC_d0_Y_10K_R2_r1.merged.bam "chr1:63650000-63730000" > d0_Young_Rep3.bam 
samtools view -b /nas/homes/annashch/Age_ATAC/outputs/d0_Young/cromwell-executions/atac/e373e737-4927-458b-b2cb-023ed08dd76e/call-bowtie2/shard-3/execution/127397_CGTACTAG-GTGTAGAT_S1_R1_001.merged.bam "chr1:63650000-63730000" > d0_Young_Rep4.bam 

#d0_Young_Pax7 "chr1:63650000-63730000" > output.bam
samtools view -b /nas/homes/annashch/Age_ATAC/caper_out/atac/ed58c174-115d-4aa9-914b-aae51edccc1e/call-bowtie2/shard-0/execution/127398_TCCTGAGC-GTGTAGAT_S2_R1_001.merged.bam "chr1:63650000-63730000" > d0_Young_Pax7_Rep1.bam 
samtools view -b /nas/homes/annashch/Age_ATAC/caper_out/atac/ed58c174-115d-4aa9-914b-aae51edccc1e/call-bowtie2/shard-1/execution/127399_TAGGCATG-GTGTAGAT_S3_R1_001.merged.bam "chr1:63650000-63730000" > d0_Young_Pax7_Rep2.bam 
samtools view -b /nas/homes/annashch/Age_ATAC/caper_out/atac/ed58c174-115d-4aa9-914b-aae51edccc1e/call-bowtie2/shard-2/execution/D0_Pax7_Young_R3_Unknown2_ACCACTGT_S14_R1_001.merged.bam "chr1:63650000-63730000" > d0_Young_Pax7_Rep3.bam 

#d1_Old "chr1:63650000-63730000" > output.bam 
samtools view -b /nas/homes/annashch/Age_ATAC/outputs/d1_Aged/cromwell-executions/atac/4eab35c7-3cb6-4836-834a-52aaf44300ce/call-bowtie2/shard-0/execution/MuSC_d1_Old_10K_R2_r1.merged.bam "chr1:63650000-63730000" > d1_Aged_Rep1.bam 
samtools view -b /nas/homes/annashch/Age_ATAC/outputs/d1_Aged/cromwell-executions/atac/4eab35c7-3cb6-4836-834a-52aaf44300ce/call-bowtie2/shard-1/execution/MuSC_d1_Old_10K_R1_r1.merged.bam "chr1:63650000-63730000" > d1_Aged_Rep2.bam 

#d1_Young "chr1:63650000-63730000" > output.bam 
samtools view -b /nas/homes/annashch/Age_ATAC/outputs/d1_Young/cromwell-executions/atac/ae7e0583-b599-4f9d-b576-2d894bf69b5f/call-bowtie2/shard-0/execution/MuSC_d1_Y_10K_R1_r1.merged.bam "chr1:63650000-63730000" > d1_Young_Rep1.bam 
samtools view -b /nas/homes/annashch/Age_ATAC/outputs/d1_Young/cromwell-executions/atac/ae7e0583-b599-4f9d-b576-2d894bf69b5f/call-bowtie2/shard-1/execution/MuSC_d1_Y_10K_R2_r1.merged.bam "chr1:63650000-63730000" > d1_Young_Rep2.bam 
samtools view -b /nas/homes/annashch/Age_ATAC/outputs/d1_Young/cromwell-executions/atac/ae7e0583-b599-4f9d-b576-2d894bf69b5f/call-bowtie2/shard-2/execution/MuSC_d1_Y_10K_R2_r1.merged.bam "chr1:63650000-63730000" > d1_Young_Rep3.bam 

#d3_Old "chr1:63650000-63730000" > output.bam
samtools view -b /nas/homes/annashch/Age_ATAC/caper_out/atac/84ec6f81-2242-4272-a514-87e55662e458/call-bowtie2/shard-0/execution/MuSC_d3_Old_25K_R1_r1.merged.bam "chr1:63650000-63730000" > d3_Aged_Rep1.bam 
samtools view -b /nas/homes/annashch/Age_ATAC/caper_out/atac/84ec6f81-2242-4272-a514-87e55662e458/call-bowtie2/shard-1/execution/MuSC_d3_Old_25K_R2_r1.merged.bam "chr1:63650000-63730000" > d3_Aged_Rep2.bam 
samtools view -b /nas/homes/annashch/Age_ATAC/caper_out/atac/84ec6f81-2242-4272-a514-87e55662e458/call-bowtie2/shard-2/execution/D3_Old_MuSC_R1_129767_TAAGGCGA_S1_R1_001.merged.bam "chr1:63650000-63730000" > d3_Aged_Rep3.bam 
samtools view -b /nas/homes/annashch/Age_ATAC/caper_out/atac/84ec6f81-2242-4272-a514-87e55662e458/call-bowtie2/shard-3/execution/D3_Old_MuSC_R2_129768_CGTACTAG_S2_R1_001.merged.bam "chr1:63650000-63730000" > d3_Aged_Rep4.bam 


#d3_Young "chr1:63650000-63730000" > output.bam
samtools view -b /nas/homes/annashch/Age_ATAC/caper_out/atac/86f0a95c-5269-46a5-9333-668fdd2285a2/call-bowtie2/shard-0/execution/MuSC_d3_Y_25K_R1_r1.merged.bam "chr1:63650000-63730000" > d3_Young_Rep1.bam 
samtools view -b /nas/homes/annashch/Age_ATAC/caper_out/atac/86f0a95c-5269-46a5-9333-668fdd2285a2/call-bowtie2/shard-1/execution/MuSC_d3_Y_25K_R2_r1.merged.bam "chr1:63650000-63730000" > d3_Young_Rep2.bam
samtools view -b /nas/homes/annashch/Age_ATAC/caper_out/atac/86f0a95c-5269-46a5-9333-668fdd2285a2/call-bowtie2/shard-2/execution/D3_Young_MuSC_R1_129774_CAGAGAGG_S8_R1_001.merged.bam "chr1:63650000-63730000" > d3_Young_Rep3.bam 
samtools view -b /nas/homes/annashch/Age_ATAC/caper_out/atac/86f0a95c-5269-46a5-9333-668fdd2285a2/call-bowtie2/shard-3/execution/D3_Young_MuSC_R2_129775_GCTACGCT_S9_R1_001.merged.bam "chr1:63650000-63730000" > d3_Young_Rep4.bam 

#d5_Old "chr1:63650000-63730000" > output.bam 
samtools view -b /nas/homes/annashch/Age_ATAC/outputs/d5_Aged/cromwell-executions/atac/cd51b1d5-c953-45a0-84e2-7c98de55808b/call-bowtie2/shard-0/execution/MuSC_d5_Old_10K_R1_r1.merged.bam "chr1:63650000-63730000" > d5_Aged_Rep1.bam 
samtools view -b /nas/homes/annashch/Age_ATAC/outputs/d5_Aged/cromwell-executions/atac/cd51b1d5-c953-45a0-84e2-7c98de55808b/call-bowtie2/shard-1/execution/MuSC_d5_Old_10K_R2_r1.merged.bam "chr1:63650000-63730000" > d5_Aged_Rep2.bam 

#d5_Young "chr1:63650000-63730000" > output.bam 
samtools view -b /nas/homes/annashch/Age_ATAC/outputs/d5_Young/cromwell-executions/atac/13ba4ec6-4586-4521-bbb8-a9f5cca58858/call-bowtie2/shard-0/execution/MuSC_d5_Y_25K_R1_r1.merged.bam "chr1:63650000-63730000" > d5_Young_Rep1.bam 
samtools view -b /nas/homes/annashch/Age_ATAC/outputs/d5_Young/cromwell-executions/atac/13ba4ec6-4586-4521-bbb8-a9f5cca58858/call-bowtie2/shard-1/execution/MuSC_d5_Y_10K_R2_r1.merged.bam "chr1:63650000-63730000" > d5_Young_Rep2.bam 

#d7_Aged "chr1:63650000-63730000" > output.bam
samtools view -b /nas/homes/annashch/Age_ATAC/caper_out/atac/3a1b6133-b734-4afe-bf11-1eb791dad207/call-bowtie2/shard-0/execution/MuSC_d7_Old_10K_R1_r1.merged.bam "chr1:63650000-63730000" > d7_Aged_Rep1.bam
samtools view -b /nas/homes/annashch/Age_ATAC/caper_out/atac/3a1b6133-b734-4afe-bf11-1eb791dad207/call-bowtie2/shard-1/execution/MuSC_d7_Old_10K_R2_r1.merged.bam "chr1:63650000-63730000" > d7_Aged_Rep2.bam 
samtools view -b /nas/homes/annashch/Age_ATAC/caper_out/atac/3a1b6133-b734-4afe-bf11-1eb791dad207/call-bowtie2/shard-2/execution/D7_Old_MuSC_129776_TGGATCTG_S10_R1_001.merged.bam "chr1:63650000-63730000" > d7_Aged_Rep3.bam 
samtools view -b /nas/homes/annashch/Age_ATAC/caper_out/atac/3a1b6133-b734-4afe-bf11-1eb791dad207/call-bowtie2/shard-3/execution/Day7_Old_Unknown1_GTCGTGAT_S13_R1_001.merged.bam "chr1:63650000-63730000" > d7_Aged_Rep4.bam 

#d7_Young "chr1:63650000-63730000" > output.bam 
samtools view -b /nas/homes/annashch/Age_ATAC/outputs/d7_Young/cromwell-executions/atac/e3042974-4252-4c53-85a4-e2f8a3af880d/call-bowtie2/shard-0/execution/MuSC_d7_Y_10K_R1_r1.merged.bam "chr1:63650000-63730000" > d7_Young_Rep1.bam 
samtools view -b /nas/homes/annashch/Age_ATAC/outputs/d7_Young/cromwell-executions/atac/e3042974-4252-4c53-85a4-e2f8a3af880d/call-bowtie2/shard-1/execution/MuSC_d7_Y_10K_R2_r1.merged.bam "chr1:63650000-63730000" > d7_Young_Rep2.bam 
samtools view -b /nas/homes/annashch/Age_ATAC/outputs/d7_Young/cromwell-executions/atac/e3042974-4252-4c53-85a4-e2f8a3af880d/call-bowtie2/shard-2/execution/MuSC_d7_Y_10K_R1_r1.merged.bam "chr1:63650000-63730000" > d7_Young_Rep3.bam 
samtools view -b /nas/homes/annashch/Age_ATAC/outputs/d7_Young/cromwell-executions/atac/e3042974-4252-4c53-85a4-e2f8a3af880d/call-bowtie2/shard-3/execution/127400_CTCTCTAC-GTGTAGAT_S4_R1_001.merged.bam "chr1:63650000-63730000" > d7_Young_Rep4.bam 
samtools view -b /nas/homes/annashch/Age_ATAC/outputs/d7_Young/cromwell-executions/atac/e3042974-4252-4c53-85a4-e2f8a3af880d/call-bowtie2/shard-4/execution/127401_CAGAGAGG-GTGTAGAT_S5_R1_001.merged.bam "chr1:63650000-63730000" > d7_Young_Rep5.bam 

