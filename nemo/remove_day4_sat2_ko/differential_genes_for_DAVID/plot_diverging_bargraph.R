rm(list=ls())
library(ggplot2)
data=read.table("DAVID_for_divergent_bargraph.csv",header=TRUE,sep='\t')
data=data[order(data$Scaled),]
data$Term=factor(data$Term,levels=data$Term)
p1=ggplot(data=data,
          aes(x=data$Term,
              y=data$Scaled))+
  geom_bar(fill='#377eb8',stat='identity')+
  xlab("Enriched GO Term")+
  ylab("-10log10(FDR)")+
  ggtitle("Day 2 DAVID Analysis")+
  coord_flip()+
  theme_bw(20)
print(p1)