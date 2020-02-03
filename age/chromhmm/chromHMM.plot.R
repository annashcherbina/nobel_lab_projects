rm(list=ls())
library(ggplot2)
library(reshape2)
source('~/helpers.R')
data=read.table("chromhmm",header=TRUE,sep='\t')
data$State=factor(data$State,levels=data$State)

m=melt(data)
m$variable=factor(m$variable,levels=c("d0_Old","d0_Y","d1_Old","d1_Y","d3_Old","d3_Y","d5_Old","d_5Y","d7_Old","d7_Y"))
colors=read.table("15_state_map.txt",header=FALSE,sep='\t')
colors$V2=colors$V2/255
colors$V3=colors$V3/255
colors$V4=colors$V4/255
cbbPalette = rgb(colors$V2,colors$V3,colors$V4)


p1=ggplot(data=m,
       aes(x=m$variable,
           y=m$value,
           group=m$State,
           fill=m$State))+
  geom_bar(position="stack",stat="identity",color="black")+
  xlab("Day")+
  ylab("Number of Differential Peaks")+
  scale_fill_manual(values=cbbPalette,name="ChromHMM State")+
  theme_bw()

#look at percents 
data[,2:ncol(data)]=t(t(data[,2:ncol(data)])/colSums(data[,2:ncol(data)]))
m=melt(data)
p2=ggplot(data=m,
          aes(x=m$variable,
              y=m$value,
              group=m$State,
              fill=m$State))+
  geom_bar(position="stack",stat="identity",color="black")+
  xlab("Day")+
  ylab("Percent of Differential Peaks")+
  scale_fill_manual(values=cbbPalette)+
  ggtitle("Naive Overlap Peak Set in Mouse Skeletal Muscle (E107) (Percent)")+
  theme_bw(20)
