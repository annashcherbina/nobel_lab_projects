rm(list=ls())
data=read.table("GOterms_Pathways_Combined.csv",header=TRUE,sep='\t')
data$P.value=-10*log10(data$P.value)
data$ClusterNew=factor(data$ClusterNew)
data$Pathway=factor(data$Pathway,levels=data$Pathway)
library(ggplot2)
p=ggplot(data,aes(x=data$Pathway,y=data$P.value,group=data$ClusterNew,fill=data$ClusterNew))+
  geom_bar(stat="identity")+
  theme(axis.text.x = element_text(angle=90, hjust=1))+
  ylab("-10log10(P-value)")+
  xlab("GO Term/Pathway")+
  scale_fill_manual(values=c('#a6cee3','#1f78b4','#b2df8a','#33a02c','#fb9a99','#e31a1c','#fdbf6f','#ff7f00','#cab2d6','#6a3d9a','#ffff99','#b15928'))


print(p)