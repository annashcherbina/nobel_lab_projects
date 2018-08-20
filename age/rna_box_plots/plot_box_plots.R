rm(list=ls())
library(ggplot2)
library(ggrepel)
data=read.table("boxplot_input.formatted.txt",header=TRUE,sep='\t',stringsAsFactors = FALSE)
data$x=paste(data$Gene,data$Age,sep='\n')
data$x=factor(data$x,levels=c(
  'Spry1\nOld',
  'Spry1\nYoung',
  'Foxo1\nOld',
  'Foxo1\nYoung',
  'Pax3\nOld',
  'Pax3\nYoung',
  'Pax7\nOld',
  'Pax7\nYoung',
  'Notch1\nOld',
  'Notch1\nYoung',
  'HeyL\nOld',
  'HeyL\nYoung',
  'Nup160\nOld',
  'Nup160\nYoung',
  'Nupl1\nOld',
  'Nupl1\nYoung',
  'Nup107\nOld',
  'Nup107\nYoung',
  'Nup133\nOld',
  'Nup133\nYoung',
  'Nup93\nOld',
  'Nup93\nYoung',
  'Gsn\nOld',
  'Gsn\nYoung',
  'Ubd\nOld',
  'Ubd\nYoung',
  'Adig\nOld',
  'Adig\nYoung',
  'Rhot1\nOld',
  'Rhot1\nYoung'))
ggplot(data=data,aes(x=x,y=TPM,fill=Gene))+
  geom_boxplot()+
  geom_dotplot(fill='black',binaxis='y', stackdir='center',position = "dodge",binwidth=0.1,stackratio = 0.5)+
  scale_y_log10()+
  xlab("Gene")+
  ylab("TPM")+
  scale_fill_manual(values=c('#a6cee3','#1f78b4','#b2df8a','#33a02c','#fb9a99','#e31a1c','#fdbf6f','#ff7f00','#cab2d6','#6a3d9a','#ffff99','#b15928','#8dd3c7','#fb8072'))+
  theme_bw()

  