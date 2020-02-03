rm(list=ls())
source("helpers.r")
data=read.table("DAVID_for_plot.csv",header=TRUE,sep='\t',stringsAsFactors = FALSE)
data$Bonferroni=-10*log10(data$Bonferroni)
library(ggplot2)
datacur1=data[data$Analysis=="MDX and WT Upregulated in Injured",]
p1=ggplot(datacur1,aes(x=datacur1$Term,y=datacur1$Bonferroni))+
  geom_bar(stat="identity",fill=c("#00FF00"))+
  ylim(0,190)+
  coord_flip()+
  ggtitle("MDX and WT Upregulated in Injured")+
  ylab("-10log10(Bonferroni p-val)")+
  xlab("")

datacur2=data[data$Analysis=="MDX and WT Downregulated in Injured",]
p2=ggplot(datacur2,aes(x=datacur2$Term,y=datacur2$Bonferroni))+
  geom_bar(stat="identity",fill=c("#FF0000"))+
  ylim(0,190)+
  coord_flip()+
  ggtitle("MDX and WT Downregulated in Injured")+
  ylab("-10log10(Bonferroni p-val)")+
  xlab("")

datacur3=data[data$Analysis=="WT Only Upregulated in Injured",]
p3=ggplot(datacur3,aes(x=datacur3$Term,y=datacur3$Bonferroni))+
  geom_bar(stat="identity",fill=c("#00FF00"))+
  ylim(0,190)+
  coord_flip()+
  ggtitle("WT Only Upregulated in Injured")+
  ylab("-10log10(Bonferroni p-val)")+
  xlab("")

datacur4=data[data$Analysis=="WT Only Downregulated in Injured",]
p4=ggplot(datacur4,aes(x=datacur4$Term,y=datacur4$Bonferroni))+
  geom_bar(stat="identity",fill=c("#FF0000"))+
  ylim(0,190)+
  coord_flip()+
  ggtitle("WT Only Downregulated in Injured")+
  ylab("-10log10(Bonferroni p-val)")+
  xlab("")

datacur5=data[data$Analysis=="MDX Only Upregulated in Injured",]
p5=ggplot(datacur5,aes(x=datacur5$Term,y=datacur5$Bonferroni))+
  geom_bar(stat="identity",fill=c("#00FF00"))+
  ylim(0,190)+
  coord_flip()+
  ggtitle("MDX Only Upregulated in Injured")+
  ylab("-10log10(Bonferroni p-val)")+
  xlab("")

datacur6=data[data$Analysis=="MDX Only Downregulated in Injured",]
p6=ggplot(datacur6,aes(x=datacur6$Term,y=datacur6$Bonferroni))+
  geom_bar(stat="identity",fill=c("#FF0000"))+
  ylim(0,190)+
  coord_flip()+
  ggtitle("MDX Only Downregulated in Injured")+
  ylab("-10log10(Bonferroni p-val)")+
  xlab("")

multiplot(p1,p3,p5,p2,p4,p6,cols=2)
