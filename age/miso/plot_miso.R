rm(list=ls())
library(ggplot2)
library(reshape2)
d0=read.table("d0_Old_vs_Y.filtered.diff",header=FALSE,sep='\t')
d1=read.table("d1_Old_vs_Y.filtered.diff",header=FALSE,sep='\t')
d3=read.table("d3_Old_vs_Y.filtered.diff",header=FALSE,sep='\t')
d5=read.table("d5_Old_vs_Y.filtered.diff",header=FALSE,sep='\t')
d7=read.table("d7_Old_vs_Y.filtered.diff",header=FALSE,sep='\t')
d0$V2=0 
d1$V2=1
d3$V2=3
d5$V2=5
d7$V2=7
data=rbind(d0,d1,d3,d5,d7)
data$V2=factor(data$V2)
p=ggplot(data=data,aes(x=data$V2,y=data$V1))+
  geom_violin(trim=TRUE,fill="#ff0000")+
  coord_flip()+
  ylab(expression(paste("Statistically significant",Delta," PSI values (p<0.05)",sep=" ")))+
  xlab("Day")+
  ggtitle("Old vs Young")+
  theme_bw(15)
print(p)