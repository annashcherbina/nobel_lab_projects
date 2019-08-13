rm(list=ls())
library(ggplot2)
data=read.table("BarChartTimeTrajectoryDiffGenes.csv",header=TRUE,sep='\t')
data$Day=factor(data$Day,levels=data$Day)
ggplot(data=data)+
  geom_bar(aes(x=data$Day,y=data$UpInYoung),stat="identity")+
  geom_bar(aes(x=data$Day,y=data$DownInYoung),stat="identity")+
  geom_hline(yintercept=0)+
  xlab("Day")+
  ylab("Number of Differential Genes")+
  theme_bw(20)