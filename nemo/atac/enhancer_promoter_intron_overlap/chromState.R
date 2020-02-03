rm(list=ls())
library(ggplot2)
library(reshape2)

data=read.table("state_inputs_for_r.txt",header=TRUE,stringsAsFactors = FALSE)
data$State=factor(data$State,levels=data$State)

data=melt(data)
p=ggplot(data=data,
         aes(x=variable,
             y=value,
             group=State,
             fill=State))+
  geom_histogram(stat="identity")+
  xlab("Sample")+
  ylab("Number of Peaks")+
  theme_bw(20)+
  scale_fill_manual(name="Chromatin State",values=c('#1b9e77','#d95f02','#7570b3','#e7298a')) 

