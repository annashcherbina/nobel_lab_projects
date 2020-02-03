rm(list=ls())
source("helpers.r")
data=read.table("DAVID_for_plot.csv",header=TRUE,sep='\t',stringsAsFactors = FALSE)
data$Bonferroni=-10*log10(data$Bonferroni)

library(ggplot2)
data$Term=factor(data$Term,levels=data$Term)
p1=ggplot(data,aes(x=Term,y=Bonferroni,size=Count,fill=Direction))+
  geom_point(shape=21)+
  coord_flip()+
  ggtitle("Significant DAVID annotations")+
  ylab("-10log10(Bonferroni p-val)")+
  xlab("")