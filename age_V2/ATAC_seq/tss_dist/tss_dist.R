rm(list=ls())
library(ggplot2)
library(reshape2)
source("~/helpers.R")
d0_A=read.table("d0_A.dist",header=FALSE,sep='\t')
d0_Y=read.table("d0_Y.dist",header=FALSE,sep='\t')
d1_A=read.table("d1_A.dist",header=FALSE,sep='\t')
d1_Y=read.table("d1_Y.dist",header=FALSE,sep='\t')
d3_A=read.table("d3_A.dist",header=FALSE,sep='\t')
d3_Y=read.table("d3_Y.dist",header=FALSE,sep='\t')
d5_A=read.table("d5_A.dist",header=FALSE,sep='\t')
d5_Y=read.table("d5_Y.dist",header=FALSE,sep='\t')
d7_A=read.table("d7_A.dist",header=FALSE,sep='\t')
d7_Y=read.table("d7_Y.dist",header=FALSE,sep='\t')

d0=merge(d0_A,d0_Y,by="V1")
names(d0)=c("Dist","Aged","Young")
d0$Dist=factor(d0$Dist,levels=c(-1000,-500,-100,-50,-10,-5,5,10,50,100,500,1000))
d0=melt(d0,id="Dist")
p1=ggplot(d0,aes(x=d0$Dist,
                 y=d0$value,
                 group=d0$variable,
                 fill=d0$variable))+
  geom_bar(stat="identity",pos="dodge")+
  ggtitle("D0")+
  scale_fill_manual(values=c("#1b9e77","#d95f02"),name="Age")+
  xlab("Distance of Peak to Nearest TSS (kb)")+
  ylab("Number of Peaks")+
  theme(legend.position="none")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))

d1=merge(d1_A,d1_Y,by="V1")
names(d1)=c("Dist","Aged","Young")
d1$Dist=factor(d1$Dist,levels=c(-1000,-500,-100,-50,-10,-5,5,10,50,100,500,1000))
d1=melt(d1,id="Dist")
p2=ggplot(d1,aes(x=d1$Dist,
                 y=d1$value,
                 group=d1$variable,
                 fill=d1$variable))+
  geom_bar(stat="identity",pos="dodge")+
  ggtitle("D1")+
  scale_fill_manual(values=c("#1b9e77","#d95f02"),name="Age")+
  xlab("Distance of Peak to Nearest TSS (kb)")+
  ylab("Number of Peaks")+
  theme(legend.position="none")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))

d3=merge(d3_A,d3_Y,by="V1")
names(d3)=c("Dist","Aged","Young")
d3$Dist=factor(d3$Dist,levels=c(-1000,-500,-100,-50,-10,-5,5,10,50,100,500,1000))
d3=melt(d3,id="Dist")
p3=ggplot(d3,aes(x=d3$Dist,
                 y=d3$value,
                 group=d3$variable,
                 fill=d3$variable))+
  geom_bar(stat="identity",pos="dodge")+
  ggtitle("D3")+
  scale_fill_manual(values=c("#1b9e77","#d95f02"),name="Age")+
  xlab("Distance of Peak to Nearest TSS (kb)")+
  ylab("Number of Peaks")+
  theme(legend.position="none")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))

d5=merge(d5_A,d5_Y,by="V1")
names(d5)=c("Dist","Aged","Young")
d5$Dist=factor(d5$Dist,levels=c(-1000,-500,-100,-50,-10,-5,5,10,50,100,500,1000))
d5=melt(d5,id="Dist")
p4=ggplot(d5,aes(x=d5$Dist,
                 y=d5$value,
                 group=d5$variable,
                 fill=d5$variable))+
  geom_bar(stat="identity",pos="dodge")+
  ggtitle("D5")+
  scale_fill_manual(values=c("#1b9e77","#d95f02"),name="Age")+
  xlab("Distance of Peak to Nearest TSS (kb)")+
  ylab("Number of Peaks")+
  theme(legend.position="none")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))

d7=merge(d7_A,d7_Y,by="V1")
names(d7)=c("Dist","Aged","Young")
d7$Dist=factor(d7$Dist,levels=c(-1000,-500,-100,-50,-10,-5,5,10,50,100,500,1000))
d7=melt(d7,id="Dist")
p5=ggplot(d7,aes(x=d7$Dist,
                 y=d7$value,
                 group=d7$variable,
                 fill=d7$variable))+
  geom_bar(stat="identity",pos="dodge")+
  ggtitle("D7")+
  scale_fill_manual(values=c("#1b9e77","#d95f02"),name="Age")+
  xlab("Distance of Peak to Nearest TSS (kb)")+
  ylab("Number of Peaks")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))

multiplot(p1,p2,p3,p4,p5,cols=5)