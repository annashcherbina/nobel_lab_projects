rm(list=ls())
source("helpers.r")
data=read.table("david_plot.txt",header=TRUE,sep='\t',stringsAsFactors = FALSE)
data$Bonferroni=-10*log10(data$Bonferroni)
data$Bonferroni[data$Bonferroni>1000]=190
library(ggplot2)
datacur1=data[data$Day==0,]
datacur1$Term=factor(datacur1$Term,levels=datacur1$Term)
p1=ggplot(datacur1,aes(x=Term,y=Bonferroni,size=Count,fill=Direction))+
  geom_point(shape=21)+
  coord_flip()+
  ggtitle("Day 0 ")+
  ylab("-10log10(Bonferroni p-val)")+
  xlab("")

datacur2=data[data$Day==2,]
datacur2$Term=factor(datacur2$Term,levels=datacur2$Term)
p2=ggplot(datacur2,aes(x=Term,y=Bonferroni,size=Count,fill=Direction))+
  geom_point(shape=21)+
  coord_flip()+
  ggtitle("Day 2 ")+
  ylab("-10log10(Bonferroni p-val)")+
  xlab("")

multiplot(p1,p2,cols=2)
