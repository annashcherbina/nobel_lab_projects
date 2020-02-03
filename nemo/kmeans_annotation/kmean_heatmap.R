rm(list=ls())
library(gplots)
data=read.table("kmeans_inputs.tsv",header=TRUE,sep='\t')
rownames(data)=data$Peak 
data$Peak=NULL 
h=heatmap.2(x=as.matrix(data),
          col=redblue(50),
          Colv=TRUE,
          Rowv=TRUE,
          scale="row",
          trace="none",
          dendrogram ="none",
          labRow="",
          cexCol = 0.5,
          margins=c(15,15))
control_z=t(h$carpet[1:4,])
nemo_z=t(h$carpet[5:12,])
mean_control_z=rowMeans(control_z)
mean_nemo_z=rowMeans(nemo_z)
df=data.frame(mean_control_z,mean_nemo_z)
h2=heatmap.2(x=as.matrix(df),
          col=redblue(50),
          Rowv=FALSE,
          Colv=FALSE,
          scale="none",
          trace="none",
          dendrogram="none",
          labRow="",
          cexCol=0.5)
#clusters=kmeans(as.matrix(data),4)
#data$cluster=clusters$cluster
#data$cluster=factor(data$cluster)
#library(ggplot2)
#ggplot(data=data,aes(x=data$NEMO_lcpm,y=data$Control_lcpm,group=data$cluster,color=data$cluster))+
#  geom_point()+
#  xlab("NEMO log2(counts per million)")+
#  ylab("Control log2(counts per million)")+
#  ggtitle("K-means clustering, k=4")

