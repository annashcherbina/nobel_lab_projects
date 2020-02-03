rm(list=ls())
data=read.table("volcano_plot_tf_expression_vs_motif_enrichment.tsv",header=TRUE,sep='\t')
library(ggplot2)
data$log10Pval=-1*data$log10Pval
data$Day0_FPKM=log10(data$Day0_FPKM)
data$Day2_FPKM=log10(data$Day2_FPKM)
data$Day4_FPKM=log10(data$Day4_FPKM)
data$Day7_FPKM=log10(data$Day7_FPKM)


#day0
ggplot(data=data,aes(x=data$Day0_lfc,y=data$log10Pval,color=data$Motif_Fam,size=data$Day0_FPKM,label=data$Motif))+
  geom_point()+
  geom_text(nudge_x=0.5,color="#000000")+
  xlab("TF expression fold change (log_2 NEMO KO/WT)")+
  ylab("Motif enrichment in peaks \nmore open in NEMO KO\n -ln(Pvalue)")+
  theme_bw(20)+
  ggtitle("Day 0")+
  xlim(c(-5,2))+
  ylim(c(0,50))+
  geom_vline(xintercept=0)+
  geom_hline(yintercept=0)+
  labs(color="TF family",
       size="WT expression\nlog10(FPKM)")


#day2
ggplot(data=data,aes(x=data$Day2_lfc,y=data$log10Pval,color=data$Motif_Fam,size=data$Day2_FPKM,label=data$Motif))+
  geom_point()+
  geom_text(nudge_x=0.5,color="#000000")+
  xlab("TF expression fold change (log_2 NEMO KO/WT)")+
  ylab("Motif enrichment in peaks \nmore open in NEMO KO\n -ln(Pvalue)")+
  theme_bw(20)+
  ggtitle("Day 2")+
  geom_vline(xintercept=0)+
  geom_hline(yintercept=0)+
  labs(color="TF family",
       size="WT expression\nlog10(FPKM)")+
  xlim(-2.5,2.5)+
  

#day4
ggplot(data=data,aes(x=data$Day4_lfc,
                     y=data$log10Pval,
                     color=data$Motif_Fam,
                     size=data$Day4_FPKM,
                     label=data$Motif))+
  geom_point()+
  geom_text(nudge_x=0.5,color="#000000")+
  xlab("TF expression fold change (log_2 NEMO KO/WT)")+
  ylab("Motif enrichment in peaks \nmore open in NEMO KO\n -ln(Pvalue)")+
  theme_bw(20)+
  ylim(c(0,50))+
  ggtitle("Day 4")+
  geom_vline(xintercept=0)+
  geom_hline(yintercept=0)+
  labs(color="TF family",
       size="WT expression\nlog10(FPKM)")

#day7
ggplot(data=data,aes(x=data$Day7_lfc,
                     y=data$log10Pval,
                     color=data$Motif_Fam,
                     size=data$Day7_FPKM,
                     label=data$Motif))+
  geom_point()+
  geom_text(nudge_x=0.5,color="#000000")+
  xlab("TF expression fold change (log_2 NEMO KO/WT)")+
  ylab("Motif enrichment in peaks \nmore open in NEMO KO\n -ln(Pvalue)")+
  theme_bw(20)+
  ggtitle("Day 7")+
  ylim(c(0,50))+
  geom_vline(xintercept=0)+
  geom_hline(yintercept=0)+
  labs(color="TF family",
       size="WT expression\nlog10(FPKM)")
