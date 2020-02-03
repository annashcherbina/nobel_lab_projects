rm(list=ls())
data=read.table("day2_sig_subset.csv",header=TRUE,sep='\t')
library(ggplot2)
#day2
data$Day2_FPKM=log10(data$Day2_FPKM)
ggplot(data=data,aes(x=data$Day2_lfc,y=data$X.10log10.Pval.,color=data$Motif_Fam,size=data$Day2_FPKM,label=data$Motif))+
  geom_point()+
  geom_text(nudge_x=0.1,color="#000000")+
  xlab("TF expression fold change log2(NEMO KO/WT)")+
  ylab("Motif enrichment in peaks \nmore open in NEMO KO\n -10log10(P)")+
  theme_bw(20)+
  ggtitle("Day 2")+
  labs(color="TF family",
       size="WT expression\nlog10(FPKM)")+
  coord_trans(y = "log10")
  
  
