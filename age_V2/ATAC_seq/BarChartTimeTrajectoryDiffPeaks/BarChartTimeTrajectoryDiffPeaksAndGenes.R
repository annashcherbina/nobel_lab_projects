rm(list=ls())
library(ggplot2)
source("~/helpers.R")
peak_data=read.table("BarChartTimeTrajectoryDiffPeaks.csv",header=TRUE,sep='\t')
peak_data$Day=factor(peak_data$Day,levels=peak_data$Day)
p1=ggplot(data=peak_data)+
  geom_bar(aes(x=peak_data$Day,y=peak_data$UpInYoung),stat="identity")+
  geom_bar(aes(x=peak_data$Day,y=peak_data$DownInYoung),stat="identity")+
  geom_hline(yintercept=0)+
  xlab("")+
  ylab("Number of Differential Peaks")+
  ggtitle("Differential ATAC-seq Peaks")+
  theme_bw(15)
gene_data=read.table("../../RNA_seq/BarChartTimeTrajectoryDiffGenes/BarChartTimeTrajectoryDiffGenes.csv",header=TRUE,sep='\t')
gene_data$Day=factor(gene_data$Day,levels=gene_data$Day)
p2=ggplot(data=gene_data)+
  geom_bar(aes(x=gene_data$Day,y=gene_data$UpInYoung),stat="identity")+
  geom_bar(aes(x=gene_data$Day,y=gene_data$DownInYoung),stat="identity")+
  geom_hline(yintercept=0)+
  xlab("Day")+
  ylab("Number of Differential Genes")+
  ggtitle("Differentially Expressed Genes")+
  theme_bw(15)
multiplot(p1,p2,cols=1)