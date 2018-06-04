SUFFIX=/Aligned.sortedByCoord.out.bam
samtools merge d0_Old.bam /home/annashch/nas/Age_RNASeq/Run_2200/MuSC_d0_Old_16K_R1R2_STAR_OUTPUT$SUFFIX /home/annashch/nas/Age_RNASeq/Run_2249/MuSC_d0_Old_16K_STAR_OUTPUT$SUFFIX /home/annashch/nas/Age_RNASeq/Run_2081/MuSC_d0_Old_STAR_OUTPUT$SUFFIX &
echo "d0_Old"

samtools merge d0_Y.bam /home/annashch/nas/Age_RNASeq/Run_2081/MuSC_d0_Y_Rep1_STAR_OUTPUT$SUFFIX /home/annashch/nas/Age_RNASeq/Run_2081/MuSC_d0_Y_Rep2_STAR_OUTPUT$SUFFIX /home/annashch/nas/Age_RNASeq/Run_2081/MuSC_d0_Y_Rep3_STAR_OUTPUT$SUFFIX &
echo "d0_Y" 

samtools merge d1_Old.bam /home/annashch/nas/Age_RNASeq/Run_2278/MuSC_d1_Old_10K_R1_STAR_OUTPUT$SUFFIX /home/annashch/nas/Age_RNASeq/Run_2278/MuSC_d1_Old_16K_R2_STAR_OUTPUT$SUFFIX &
echo "d1_Old" 

samtools merge d1_Y.bam /home/annashch/nas/Age_RNASeq/Run_2278/MuSC_d1_Y_10K_R2_STAR_OUTPUT$SUFFIX /home/annashch/nas/Age_RNASeq/Run_2249/MuSC_d1_Y_10K_R1_STAR_OUTPUT$SUFFIX /home/annashch/nas/Age_RNASeq/Run_2249/MuSC_d1_Y_10K_R2_STAR_OUTPUT$SUFFIX /home/annashch/nas/Age_RNASeq/Run_2081/MuSC_d1_Y_STAR_OUTPUT$SUFFIX &
echo "d1_Y"

samtools merge d3_Old.bam /home/annashch/nas/Age_RNASeq/Run_2249/MuSC_d3_Old_40K_R1_STAR_OUTPUT$SUFFIX /home/annashch/nas/Age_RNASeq/Run_2081/MuSC_d3_Old_STAR_OUTPUT$SUFFIX &
echo "d3_Old"

samtools merge d3_Y.bam /home/annashch/nas/Age_RNASeq/Run_2200/MuSC_d3_Y_38K_R1_STAR_OUTPUT$SUFFIX /home/annashch/nas/Age_RNASeq/Run_2249/MuSC_d3_Y_38K_R1_STAR_OUTPUT$SUFFIX /home/annashch/nas/Age_RNASeq/Run_2081/MuSC_d3_Y_STAR_OUTPUT$SUFFIX &
echo "d3_Y"

samtools merge d5_Old.bam /home/annashch/nas/Age_RNASeq/Run_2200/MuSC_d5_Old_40K_R1_STAR_OUTPUT$SUFFIX /home/annashch/nas/Age_RNASeq/Run_2249/MuSC_d5_Old_40K_STAR_OUTPUT$SUFFIX &
echo "d5_Old"


samtools merge d5_Y.bam /home/annashch/nas/Age_RNASeq/Run_2200/MuSC_d5_Y_32K_R1_STAR_OUTPUT$SUFFIX /home/annashch/nas/Age_RNASeq/Run_2249/MuSC_d5_Y_32K_R1_STAR_OUTPUT$SUFFIX /home/annashch/nas/Age_RNASeq/Run_2081/MuSC_d5_Y_STAR_OUTPUT$SUFFIX &
echo "d5_Y"

samtools merge d7_Old.bam /home/annashch/nas/Age_RNASeq/Run_2249/MuSC_d7_Old_5K_R2_STAR_OUTPUT$SUFFIX /home/annashch/nas/Age_RNASeq/Run_2278/MuSC_d7_Old_5K_R1_STAR_OUTPUT$SUFFIX &
echo "d7_Old"

samtools merge d7_Y.bam /home/annashch/nas/Age_RNASeq/Run_2249/MuSC_d7_Y_5K_R1_STAR_OUTPUT$SUFFIX /home/annashch/nas/Age_RNASeq/Run_2249/MuSC_d7_Y_5K_R2_STAR_OUTPUT$SUFFIX &
echo "d7_Y" 


