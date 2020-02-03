rm(list=ls())
library(ggplot2)
source("~/helpers.R")
library(reshape2)

data=read.table("pie_chart_inputs.tsv",header=TRUE,sep='\t')
data=subset(data,select=c("Sample","ProximalPercent","DistalPercent"))
samples=data$Sample
for(sample  in samples)
{
  subset=data[data$Sample==sample,]
  m=melt(subset)
  svg(filename=paste(sample,"svg",sep='.'),
      height=3,
      width=3,
      pointsize=12)
  print(ggplot(m,aes(x="",y=value,fill=variable))+
    geom_bar(width=1,stat="identity")+
    coord_polar("y",start=0)+
    ggtitle(sample)+
    scale_fill_brewer(palette="Dark2"))
  dev.off() 
}