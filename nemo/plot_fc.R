rm(list=ls())
library(ggplot2)
library(data.table)
require(reshape)
data=data.frame(read.table('RSEM.genes.fpkm.gt1.tsv',header=T,sep='\t'))
data$GeneId=NULL
data$GeneName=NULL

for(n in 1:ncol(data)){
  cur_title=names(data)[n]
  cur_values=subset(data,select=c(cur_title))
  #png(filename=paste(cur_title,".png",sep=""))
  ggplot(cur_values,aes(cur_values))+
    geom_histogram()+
    ggtitle(cur_title)+
    xlab("Fold Change")+
    theme_bw(20)
  #dev.off() 
  ggsave(file=paste(cur_title,".png",sep=""))
  cur_title
}