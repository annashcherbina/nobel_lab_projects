rm(list=ls())
data=read.table("chromhmm.annotated.df.txt",header=TRUE,sep='\t')
library(ggplot2)
library(reshape2)
data=melt(data,id="State")
library(RColorBrewer)
darkcols=colorRampPalette(brewer.pal(9, "Set1"))(15) 
ggplot(data,aes(x=data$variable,y=data$value,group=data$State,fill=data$State))+
  geom_bar(stat="identity")+
  theme_bw(15)+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  ylab("ChromHMM Annotation (Percentage)")+
  xlab("Sample_AnnotationSource")+
  scale_fill_manual(name="Chromatin State",values=darkcols)

#only heart 
data=read.table("chromhmm.annotated.df.txt",header=TRUE,sep='\t')
data=subset(data,select=c("State","Control_Heart.ENCFF786MCR","NEMO_Heart.ENCFF786MCR","Differential_Heart.ENCFF786MCR"))
data=melt(data,id="State")
library(RColorBrewer)
darkcols=colorRampPalette(brewer.pal(9, "Set1"))(15) 
ggplot(data,aes(x=data$variable,y=data$value,group=data$State,fill=data$State))+
  geom_bar(stat="identity")+
  theme_bw(15)+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  ylab("ChromHMM Annotation (Percentage)")+
  xlab("Sample_AnnotationSource")+
  scale_fill_manual(name="Chromatin State",values=darkcols)

#only embryonic limb 
data=read.table("chromhmm.annotated.df.txt",header=TRUE,sep='\t')
data=subset(data,select=c("State",
                          "Control_Limb.Embryonic.ENCFF070VHJ",
                          "NEMO_Limb.Embryonic.ENCFF070VHJ",
                          "Differential_Limb.Embryonic.ENCFF070VHJ"))
data=melt(data,id="State")
ggplot(data,aes(x=data$variable,y=data$value,group=data$State,fill=data$State))+
  geom_bar(stat="identity")+
  theme_bw(15)+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  ylab("ChromHMM Annotation (Percentage)")+
  xlab("Sample_AnnotationSource")+
  scale_fill_manual(name="Chromatin State",values=darkcols)