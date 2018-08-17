rm(list=ls())
library(ggplot2)
library(ggrepel)
data=read.table("boxplot_input.txt",header=TRUE,sep='\t')
data$x=paste(data$Gene.Group,data$Age,sep='\n')
ggplot(data=data,aes(x=x,y=TPM,fill=Gene.Group,label=GeneName))+
  geom_boxplot()+
  geom_dotplot(binaxis='y', stackdir='center')+
  scale_y_log10()+
  geom_text_repel()+
  scale_fill_manual(values=c('#1b9e77','#d95f02','#7570b3'))+
  xlab("Gene")

  