rm(list=ls())
library(reshape2)
library(dplyr)
library(tidyr)
library(ggplot2)
#make subsets
#data=read.table("RNA_transformed_tpm_minus_sva_contribs.group_by_rep.txt",header=TRUE,sep='\t')
#data$ens_gene=rownames(data)

#data=data %>%separate("ens_gene",c("ens","gene"),"_")
#genes_to_keep=c("Myog","Myh3","Tmem8c","Tcf3","Tcf4","Tcf12","Myf5","E2f1","E2f2","Prdm9","Prdm16")

#subset=data[data$gene %in% genes_to_keep,]
#m=melt(subset)
#write.table(m,"subset.tsv",sep='\t')

#http://www.sthda.com/english/wiki/ggplot2-box-plot-quick-start-guide-r-software-and-data-visualization
data=read.table("subset.tsv",header=TRUE,sep='\t')
#fig1
Myog=data[data$Gene=="Myog",]
p1=ggplot(Myog,aes(x=factor(Myog$Age),
                y=Myog$TPM,
                fill=Myog$Age))+
  geom_boxplot()+
  geom_dotplot(binaxis='y', stackdir='center', dotsize=1)+
  facet_wrap(Myog$Day,nrow=1,ncol=5)+
  scale_fill_manual(name="Age",values=c("#FF0000","#0000FF"))+
  xlab("Myog")+
  ylab("TPM")

Myh3=data[data$Gene=="Myh3",]
p2=ggplot(Myh3,aes(x=factor(Myh3$Age),
                y=Myh3$TPM,
                fill=Myh3$Age))+
  geom_boxplot()+
  geom_dotplot(binaxis='y', stackdir='center', dotsize=1)+
  facet_wrap(Myh3$Day,nrow=1,ncol=5)+
  scale_fill_manual(name="Age",values=c("#FF0000","#0000FF"))+
  xlab("Myh3")+
  ylab("TPM")

Tmem8c=data[data$Gene=="Tmem8c",]
p3=ggplot(Tmem8c,aes(x=factor(Tmem8c$Age),
                y=Tmem8c$TPM,
                fill=Tmem8c$Age))+
  geom_boxplot()+
  geom_dotplot(binaxis='y', stackdir='center', dotsize=1)+
  facet_wrap(Tmem8c$Day,nrow=1,ncol=5)+
  scale_fill_manual(name="Age",values=c("#FF0000","#0000FF"))+
  xlab("Tmem8c")+
  ylab("TPM")

source("~/helpers.R")
multiplot(p1,p2,p3,cols=1)


Tcf3=data[data$Gene=="Tcf3",]
p4=ggplot(Tcf3,aes(x=factor(Tcf3$Day),
                   y=Tcf3$TPM,
                   fill=Tcf3$Age))+
  geom_boxplot()+
  geom_dotplot(binaxis='y', position='dodge', dotsize=0.3)+
  scale_fill_manual(name="Age",values=c("#FF0000","#0000FF"))+
  xlab("Tcf3")+
  ylab("TPM")

Tcf4=data[data$Gene=="Tcf4",]
p5=ggplot(Tcf4,aes(x=factor(Tcf4$Day),
                   y=Tcf4$TPM,
                   fill=Tcf4$Age))+
  geom_boxplot()+
  geom_dotplot(binaxis='y', position='dodge', dotsize=0.3)+
  scale_fill_manual(name="Age",values=c("#FF0000","#0000FF"))+
  xlab("Tcf4")+
  ylab("TPM")


Tcf12=data[data$Gene=="Tcf12",]
p6=ggplot(Tcf12,aes(x=factor(Tcf12$Day),
                   y=Tcf12$TPM,
                   fill=Tcf12$Age))+
  geom_boxplot()+
  geom_dotplot(binaxis='y', position='dodge', dotsize=0.3)+
  scale_fill_manual(name="Age",values=c("#FF0000","#0000FF"))+
  xlab("Tcf12")+
  ylab("TPM")

Myf5=data[data$Gene=="Myf5",]
p7=ggplot(Myf5,aes(x=factor(Myf5$Day),
                   y=Myf5$TPM,
                   fill=Myf5$Age))+
  geom_boxplot()+
  geom_dotplot(binaxis='y', position='dodge', dotsize=0.3)+
  scale_fill_manual(name="Age",values=c("#FF0000","#0000FF"))+
  xlab("Myf5")+
  ylab("TPM")



E2f1=data[data$Gene=="E2f1",]
p8=ggplot(E2f1,aes(x=factor(E2f1$Day),
                y=E2f1$TPM,
                fill=E2f1$Age))+
  geom_boxplot()+
  geom_dotplot(binaxis='y', position='dodge', dotsize=0.3)+
  scale_fill_manual(name="Age",values=c("#FF0000","#0000FF"))+
  xlab("E2f1")+
  ylab("TPM")
  

E2f2=data[data$Gene=="E2f2",]
p9=ggplot(E2f2,aes(x=factor(E2f2$Day),
                   y=E2f2$TPM,
                   fill=E2f2$Age))+
  geom_boxplot()+
  geom_dotplot(binaxis='y', position='dodge', dotsize=0.3)+
  scale_fill_manual(name="Age",values=c("#FF0000","#0000FF"))+
  xlab("E2f2")+
  ylab("TPM")

Prdm9=data[data$Gene=="Prdm9",]
p10=ggplot(Prdm9,aes(x=factor(Prdm9$Day),
                   y=Prdm9$TPM,
                   fill=Prdm9$Age))+
  geom_boxplot()+
  geom_dotplot(binaxis='y', position='dodge', dotsize=0.3)+
  scale_fill_manual(name="Age",values=c("#FF0000","#0000FF"))+
  xlab("Prdm9")+
  ylab("TPM")

Prdm16=data[data$Gene=="Prdm16",]
p11=ggplot(Prdm16,aes(x=factor(Prdm16$Day),
                   y=Prdm16$TPM,
                   fill=Prdm16$Age))+
  geom_boxplot()+
  geom_dotplot(binaxis='y', position='dodge',dotsize=0.3)+
  scale_fill_manual(name="Age",values=c("#FF0000","#0000FF"))+
  xlab("Prdm16")+
  ylab("TPM")

svg("Fig3f.svg")
multiplot(p4,p5,p6,p7,p8,p9,p10,p11,cols=2)
dev.off()
