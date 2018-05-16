rm(list=ls())
library(gplots)
library(data.table)
data=data.frame(read.table('oxredux.txt',header=T,sep='\t'))
rownames=data$Gene
data$Gene=NULL
x=as.matrix(na.omit(log2(data)))
x[!is.finite(x)] <- 0
heatmap.2(x,
          cexCol=1,
          col=redblue,
          dendrogram="none",
          margins=c(5,10),
          scale="none",
          trace="none",
          Rowv=TRUE,
          Colv=FALSE,
          labRow=rownames,
          keysize=1,
          main="log2(FPKM)\nOxidative Stress")
