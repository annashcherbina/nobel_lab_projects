rm(list=ls())
library(ggplot2)
library(reshape2)
source('~/helpers.R')
young=read.table("chromhmm.upinyoung",header=TRUE,sep=',')
young$State=factor(young$State,levels=young$State)
old=read.table("chromhmm.upinold",header=TRUE,sep=',')
old$State=factor(old$State,levels=old$State)

m_young=melt(young)
m_old=melt(old)

colors=read.table("15_state_map.txt",header=FALSE,sep='\t')
colors$V2=colors$V2/255
colors$V3=colors$V3/255
colors$V4=colors$V4/255
cbbPalette = rgb(colors$V2,colors$V3,colors$V4)


p1=ggplot(data=m_young,
       aes(x=m_young$variable,
           y=m_young$value,
           group=m_young$State,
           fill=m_young$State))+
  geom_bar(position="stack",stat="identity",color="black")+
  xlab("Day")+
  ylab("Number of Differential Peaks")+
  scale_fill_manual(values=cbbPalette)+
  ggtitle("More Accessible in Young")+
  theme_bw(20)

p2=ggplot(data=m_old,
          aes(x=m_old$variable,
              y=m_old$value,
              group=m_old$State,
              fill=m_old$State))+
  geom_bar(position="stack",stat="identity",color='black')+
  xlab("Day")+
  ylab("Number of Differential Peaks")+
  scale_fill_manual(values=cbbPalette)+
  ggtitle("More Accessible in Aged")+
  theme_bw(20)


multiplot(p1,p2,cols=2)

#look at percents 
young[,2:ncol(young)]=t(t(young[,2:ncol(young)])/colSums(young[,2:ncol(young)]))
old[,2:ncol(old)]=t(t(old[,2:ncol(old)])/colSums(old[,2:ncol(old)]))

m_young=melt(young)
m_old=melt(old)

p3=ggplot(data=m_young,
          aes(x=m_young$variable,
              y=m_young$value,
              group=m_young$State,
              fill=m_young$State))+
  geom_bar(position="stack",stat="identity",color="black")+
  xlab("Day")+
  ylab("Percent of Differential Peaks")+
  scale_fill_manual(values=cbbPalette)+
  ggtitle("More Accessible in Young")+
  theme_bw(20)

p4=ggplot(data=m_old,
          aes(x=m_old$variable,
              y=m_old$value,
              group=m_old$State,
              fill=m_old$State))+
  geom_bar(position="stack",stat="identity",color='black')+
  xlab("Day")+
  ylab("Percent of Differential Peaks")+
  scale_fill_manual(values=cbbPalette)+
  ggtitle("More Accessible in Aged")+
  theme_bw(20)


multiplot(p3,p4,cols=2)
