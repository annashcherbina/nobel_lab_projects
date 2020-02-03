rm(list=ls())
library(ggplot2)
library(stringr)
data=read.table("volcano_input.txt",header=TRUE,sep='\t')
data$RNA_fc_young_over_aged=asinh(data$RNA_fc_young_over_aged)
data$Motif=str_to_title(data$Motif)
library(ggplot2)
d0=data[data$Day==0,]
svg("d0.svg")
print(ggplot(data=d0,
       aes(x=d0$RNA_fc_young_over_aged,
           y=d0$HOMER_pval_young_over_aged,
           size=d0$RNA_mean,
           color=d0$Family,
           label=d0$Motif))+
        geom_vline(xintercept=0,size=1.25,color="#bab8b3")+
        geom_hline(yintercept=0,size=1.25,color='#bab8b3')+
  geom_point()+
  scale_size(name="Mean TPM")+
  scale_color_manual(name="Motif Family",values=c('#a6cee3','#1f78b4','#b2df8a','#33a02c','#fb9a99','#e31a1c','#fdbf6f','#ff7f00','#cab2d6','#6a3d9a','#ffff99','#b15928','#8dd3c7'))+
  geom_text(color="black",size=5,nudge_y = 1,check_overlap=FALSE)+
  ggtitle("Day 0")+
  xlab("log2(RNA TPM Young/Aged)")+
  ylab("-10log10(HOMER P-value)"))
dev.off() 

d1=data[data$Day==1,]
svg("d1.svg")
print(ggplot(data=d1,
       aes(x=d1$RNA_fc_young_over_aged,
           y=d1$HOMER_pval_young_over_aged,
           size=d1$RNA_mean,
           color=d1$Family,
           label=d1$Motif))+
        geom_vline(xintercept=0,size=1.25,color='#bab8b3')+
        geom_hline(yintercept=0,size=1.25,color='#bab8b3')+
  geom_point()+
  scale_size(name="Mean TPM")+
  scale_color_manual(name="Motif Family",values=c('#a6cee3','#1f78b4','#b2df8a','#33a02c','#fb9a99','#e31a1c','#fdbf6f','#ff7f00','#cab2d6','#6a3d9a','#ffff99','#b15928','#8dd3c7'))+
  geom_text(color="black",size=5,nudge_y = 1,check_overlap=FALSE)+
  ggtitle("Day 1")+
  xlab("log2(RNA TPM Young/Aged)")+
  ylab("-10log10(HOMER P-value)"))
dev.off() 

d3=data[data$Day==3,]
svg('d3.svg')
print(ggplot(data=d3,
       aes(x=d3$RNA_fc_young_over_aged,
           y=d3$HOMER_pval_young_over_aged,
           size=d3$RNA_mean,
           color=d3$Family,
           label=d3$Motif))+
        geom_vline(xintercept=0,size=1.25,color='#bab8b3')+
        geom_hline(yintercept=0,size=1.25,color='#bab8b3')+
  geom_point()+
  scale_size(name="Mean TPM")+
  scale_color_manual(name="Motif Family",values=c('#a6cee3','#1f78b4','#b2df8a','#33a02c','#fb9a99','#e31a1c','#fdbf6f','#ff7f00','#cab2d6','#6a3d9a','#ffff99','#b15928','#8dd3c7'))+
  geom_text(color="black",size=5,nudge_y = 1,check_overlap=FALSE)+
  ggtitle("Day 3")+
  xlab("log2(RNA TPM Young/Aged)")+
  ylab("-10log10(HOMER P-value)"))
dev.off() 

d5=data[data$Day==5,]
svg('d5.svg')
print(ggplot(data=d5,
       aes(x=d5$RNA_fc_young_over_aged,
           y=d5$HOMER_pval_young_over_aged,
           size=d5$RNA_mean,
           color=d5$Family,
           label=d5$Motif))+
        geom_vline(xintercept=0,size=1.25,color='#bab8b3')+
        geom_hline(yintercept=0,size=1.25,color='#bab8b3')+
  geom_point()+
  scale_size(name="Mean TPM")+
  scale_color_manual(name="Motif Family",values=c('#a6cee3','#1f78b4','#b2df8a','#33a02c','#fb9a99','#e31a1c','#fdbf6f','#ff7f00','#cab2d6','#6a3d9a','#ffff99','#b15928','#8dd3c7'))+
  geom_text(color="black",size=5,nudge_y = 1,check_overlap=FALSE)+
  ggtitle("Day 5")+
  xlab("log2(RNA TPM Young/Aged)")+
  ylab("-10log10(HOMER P-value)"))
dev.off() 

d7=data[data$Day==7,]
svg("d7.svg")
print(ggplot(data=d7,
       aes(x=d7$RNA_fc_young_over_aged,
           y=d7$HOMER_pval_young_over_aged,
           size=d7$RNA_mean,
           color=d7$Family,
           label=d7$Motif))+
        geom_vline(xintercept=0,size=1.25,color='#bab8b3')+
        geom_hline(yintercept=0,size=1.25,color='#bab8b3')+
  geom_point()+
  scale_size(name="Mean TPM")+
  scale_color_manual(name="Motif Family",values=c('#a6cee3','#1f78b4','#b2df8a','#33a02c','#fb9a99','#e31a1c','#fdbf6f','#ff7f00','#cab2d6','#6a3d9a','#ffff99','#b15928','#8dd3c7'))+
  geom_text(color="black",size=5,nudge_y = 1,check_overlap=FALSE)+
  ggtitle("Day 7")+
  xlab("log2(RNA TPM Young/Aged)")+
  ylab("-10log10(HOMER P-value)"))
dev.off() 


