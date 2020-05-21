rm(list=ls())
library(ggplot2)
source('~/helpers.R')
data=read.table('d0_tpm_rep_averaged_with_coords.annotated.bed',header=TRUE,sep='\t')
#only plot for genes with tpm>=1 in one of the conditions 
data=data[(data$D0_A>=1)|(data$D0_Y>=1),]
data$D0_A[data$D0_A<=0]=0.001
data$D0_Y[data$D0_Y<=0]=0.001 
data$D0_A=log2(data$D0_A)
data$D0_Y=log2(data$D0_Y)
data$H4K20me1_Status=factor(data$H4K20me1_Status,levels=c("None","Aged","Young","Both"))
none=data[data$H4K20me1_Status=="None",]
young=data[data$H4K20me1_Status=="Young",]
aged=data[data$H4K20me1_Status=="Aged",]
both=data[data$H4K20me1_Status=="Both",]
p1=ggplot(data=none,
       aes(x=none$D0_Y,
           y=none$D0_A))+
  geom_point(alpha=0.5, color="#808080")+
  xlab("log2(TPM) Young")+
  ylab("log2(TPM) Aged")+
  geom_abline()+
  xlim(0,15)+
  ylim(0,15)+
  ggtitle("No H4K20me1, n=7940")+
  theme_bw()

p2=ggplot(data=aged,
          aes(x=aged$D0_Y,
              y=aged$D0_A))+
  geom_point(alpha=0.5, color="#FF0000")+
  xlab("log2(TPM) Young")+
  ylab("log2(TPM) Aged")+
  geom_abline()+
  xlim(0,15)+
  ylim(0,15)+
  ggtitle("H4K20me1 in Aged, n=625")+
  theme_bw()

p3=ggplot(data=both,
          aes(x=both$D0_Y,
              y=both$D0_A))+
  geom_point(alpha=0.5, color="#800080")+
  xlab("log2(TPM) Young")+
  ylab("log2(TPM) Aged")+
  geom_abline()+
  xlim(0,15)+
  ylim(0,15)+
  ggtitle("H4K20me1 in Young+Aged, n=5513")+
  theme_bw()

p4=ggplot(data=young,
          aes(x=young$D0_Y,
              y=young$D0_A))+
  geom_point(alpha=0.5, color="#0000FF")+
  xlab("log2(TPM) Young")+
  ylab("log2(TPM) Aged")+
  geom_abline()+
  xlim(0,15)+
  ylim(0,15)+
  ggtitle("H4K20me1 in Young, n=1089")+
  theme_bw()
multiplot(p1,p2,p3,p4,cols=2)

data$H4K20me1_Y_or_A=factor(data$H4K20me1_Y_or_A,levels=c(0,1))
data=data[order(data$H4K20me1_Y_or_A),]
p5=ggplot(data=data,
          aes(x=data$D0_Y,
              y=data$D0_A,
              color=data$H4K20me1_Y_or_A))+
  geom_point()+
  xlab("log2(TPM) Young")+
  ylab("log2(TPM) Aged")+
  geom_abline()+
  ggtitle("Genes with TPM>=1 in Young or Aged")+
  theme_bw()+
  scale_color_manual(values=c("#808080","#0000FF"),labels=c("No H4K20me1","H4K20me1"),name="Gene intersection with H4K20me1")
p5
