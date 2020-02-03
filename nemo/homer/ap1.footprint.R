rm(list=ls())
library(ggplot2)
data=read.table("ap1.footprint",header=TRUE,sep='\t')
names(data)=c("Distance_From_Center","Homer_Total_Sites","Homer_+_Sites","Homer_-_Sites","A.frequency","T_frequency","G.frequency","T.frequency")
sites=subset(data,selec=c("Distance_From_Center","Homer_Total_Sites","Homer_+_Sites","Homer_-_Sites"))
library(reshape2)
sites_melted=melt(sites,id="Distance_From_Center")
ggplot(data=sites_melted,aes(x=sites_melted$Distance_From_Center,y=sites_melted$value,group=sites_melted$variable,color=sites_melted$variable))+
  geom_line()+
  xlab("Distance From Center")+
  ggtitle("AP-1 Motif Footprint Analysis")