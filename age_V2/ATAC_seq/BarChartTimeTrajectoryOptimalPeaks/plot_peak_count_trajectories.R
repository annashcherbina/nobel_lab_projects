rm(list=ls())
library(ggplot2)

data=read.table("optimal_peak_counts.txt",header=TRUE,sep='\t')
data$Day=factor(data$Day,levels=c(0,1,3,5,7))
ggplot(data=data,aes(x=data$Day,y=data$Count,group=data$Age,fill=data$Age))+
  geom_bar(stat='identity',position='dodge')+
  scale_fill_manual(name="Age",values=c('#66c2a5','#fc8d62'))+
  xlab("Day")+
  ylab("Number of Accessible Regions")
