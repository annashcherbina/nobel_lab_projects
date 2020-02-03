rm(list=ls())
data=read.table("motif_pval_to_gene_fc.txt",header=TRUE,sep='\t')
library(ggplot2)
d0=data[data$Day==0,]
d1=data[data$Day==1,]
d3=data[data$Day==3,]
d5=data[data$Day==5,]
d7=data[data$Day==5,]
d0$TFFamily=factor(d0$TFFamily)
ggplot(data=d0,
       aes(x=log2(d0$d0_Y_v_O),
           y=d0$X.10log10Pval,
           color=d0$TFFamily,
           size=d0$MedianTPM,
           label=d0$Motif))+
  geom_point()+
  geom_text(color="black",size=3,alpha=0.5, nudge_y = 10,check_overlap = TRUE)+
  xlab("log2 (Young TPM / Aged TPM)")+
  ylab("Motif enrichment in peaks more open in\n young than in old (-10log10(Pvalue))")+
  ggtitle("Day 0")+
  geom_vline(xintercept=0,size=1.25)+
  geom_hline(yintercept=0,size=1.25)+
  scale_size_continuous(name="Median TPM Day 0")+
  scale_color_manual(values=c('#a6cee3','#1f78b4','#b2df8a','#33a02c','#fb9a99','#e31a1c','#fdbf6f','#ff7f00','#cab2d6','#6a3d9a'),name="TF Family")


d1$TFFamily=factor(d1$TFFamily)
ggplot(data=d1,
       aes(x=log2(d1$d1_Y_v_O),
           y=d1$X.10log10Pval,
           color=d1$TFFamily,
           size=d1$MedianTPM,
           label=d1$Motif))+
  geom_point()+
  geom_text(color="black",size=3,alpha=0.5, nudge_y = 10,check_overlap = TRUE)+
  xlab("log2 (Young TPM / Aged TPM)")+
  ylab("Motif enrichment in peaks more open in\n young than in old (-10log10(Pvalue))")+
  ggtitle("Day 1")+
  geom_vline(xintercept=0,size=1.25)+
  geom_hline(yintercept=0,size=1.25)+
  scale_size_continuous(name="Median TPM Day 1")+
  scale_color_manual(values=c('#a6cee3','#1f78b4','#b2df8a','#33a02c','#fb9a99','#e31a1c','#fdbf6f','#ff7f00','#cab2d6','#6a3d9a','#ffff99'),name="TF Family")


d3$TFFamily=factor(d3$TFFamily)
ggplot(data=d3,
       aes(x=log2(d3$d3_Y_v_O),
           y=d3$X.10log10Pval,
           color=d3$TFFamily,
           size=d3$MedianTPM,
           label=d3$Motif))+
  geom_point()+
  geom_text(color="black",size=3,alpha=0.5, nudge_y = 10,check_overlap = TRUE)+
  xlab("log2 (Young TPM / Aged TPM)")+
  ylab("Motif enrichment in peaks more open in\n young than in old (-10log10(Pvalue))")+
  ggtitle("Day 3")+
  geom_vline(xintercept=0,size=1.25)+
  geom_hline(yintercept=0,size=1.25)+
  scale_size_continuous(name="Median TPM Day 3")+
  scale_color_manual(values=c('#a6cee3','#1f78b4','#b2df8a','#33a02c','#fb9a99','#e31a1c','#fdbf6f','#ff7f00','#cab2d6','#6a3d9a','#ffff99','#b15928'),name="TF Family")



d5$TFFamily=factor(d5$TFFamily)
ggplot(data=d5,
       aes(x=log2(d5$d5_Y_v_O),
           y=d5$X.10log10Pval,
           color=d5$TFFamily,
           size=d5$MedianTPM,
           label=d5$Motif))+
  geom_point()+
  geom_text(color="black",size=3,alpha=0.5, nudge_y = 10,check_overlap = TRUE)+
  xlab("log2 (Young TPM / Aged TPM)")+
  ylab("Motif enrichment in peaks more open in\n young than in old (-10log10(Pvalue))")+
  ggtitle("Day 5")+
  geom_vline(xintercept=0,size=1.25)+
  geom_hline(yintercept=0,size=1.25)+
  scale_size_continuous(name="Median TPM Day 5")+
  scale_color_manual(values=c('#a6cee3','#1f78b4','#b2df8a','#33a02c','#fb9a99','#e31a1c','#fdbf6f','#ff7f00','#cab2d6','#6a3d9a','#ffff99','#b15928'),name="TF Family")


d7$TFFamily=factor(d7$TFFamily)
ggplot(data=d7,
       aes(x=log2(d7$d7_Y_v_O),
           y=d7$X.10log10Pval,
           color=d7$TFFamily,
           size=d7$MedianTPM,
           label=d7$Motif))+
  geom_point()+
  geom_text(color="black",size=3,alpha=0.5, nudge_y = 10,check_overlap = TRUE)+
  xlab("log2 (Young TPM / Aged TPM)")+
  ylab("Motif enrichment in peaks more open in\n young than in old (-10log10(Pvalue))")+
  ggtitle("Day 7")+
  geom_vline(xintercept=0,size=1.25)+
  geom_hline(yintercept=0,size=1.25)+
  scale_size_continuous(name="Median TPM Day 7")+
  scale_color_manual(values=c('#a6cee3','#1f78b4','#b2df8a','#33a02c','#fb9a99','#e31a1c','#fdbf6f','#ff7f00','#cab2d6','#6a3d9a','#ffff99','#b15928'),name="TF Family")
