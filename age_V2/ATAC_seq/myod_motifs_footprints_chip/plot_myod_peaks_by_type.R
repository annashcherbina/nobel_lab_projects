rm(list=ls())
library(ggplot2)
data=read.table('myod_peak_by_type.csv',header=TRUE,sep='\t')
p1=ggplot(data=data,aes(x=data$Sample,
                        y=data$Count,
                        group=data$Category,
                        fill=data$Category))+
  geom_bar(position='stack',stat='identity')+
  scale_fill_manual(values=c( "#e41a1c", "#377eb8", "#4daf4a", "#984ea3"),name="Peak")+
  xlab("Sample")+
  ylab("No. MYOD ChIP-seq Peaks")+
  ggtitle("MYOD TF-Binding Characterization")+
  theme_bw(15)+
  theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))


