rm(list=ls())
library(ggplot2)
library(reshape2)
colors=read.table("colors.txt",header=FALSE,sep='\t')
colors$V1=colors$V1/255
colors$V2=colors$V2/255
colors$V3=colors$V3/255
cbbPalette = rgb(colors$V1,colors$V2,colors$V3)

tallies=read.table("chromHMM.overall.tally.csv",header=TRUE,sep='\t',stringsAsFactors = FALSE)
tallies$State=factor(tallies$State,levels=tallies$State)
melted=melt(tallies)
p1=ggplot(data=melted,aes(x=variable,y=value,group=State,fill=State))+
  geom_bar(stat="identity")+
  theme_bw()+
  ggtitle("7 Chromatin State Distribution")+
  xlab("Samples")+
  ylab("Number of Peaks")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  scale_fill_manual(values=cbbPalette)+
  theme_bw(20)+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


tallies=read.table("chromHMM.overall.tally.normalized.csv",header=TRUE,sep='\t',stringsAsFactors = FALSE)
tallies$State=factor(tallies$State,levels=tallies$State)
melted=melt(tallies)
p2=ggplot(data=melted,aes(x=variable,y=value,group=State,fill=State))+
  geom_bar(stat="identity")+
  theme_bw()+
  ggtitle("7 Chromatin State Distribution")+
  xlab("Samples")+
  ylab("Fraction of Peaks")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  scale_fill_manual(values=cbbPalette)+
  theme_bw(20)+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

