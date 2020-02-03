rm(list=ls())
library(gplots,quietly=TRUE)
d0=read.table("d0.ave.hmap.inputs",header=TRUE,row.names = 1,sep='\t')
d3=read.table("d3.ave.hmap.inputs",header=TRUE,row.names = 1,sep='\t')
d7=read.table("d7.ave.hmap.inputs",header=TRUE,row.names = 1,sep='\t')
allnames=names(d0)
d0_diag=diag(as.matrix(d0))
d3_diag=diag(as.matrix(d3))
d7_diag=diag(as.matrix(d7))
data=data.frame(d0_diag,d3_diag,d7_diag)
names(data)=c("0dpi","3dpi","7dpi")
rownames(data)=allnames
library(RColorBrewer)

x <- scale(as.matrix(t(log2(data))))


heatmap.2(x,
          scale     = "none",
          col       = rev(colorRampPalette(brewer.pal(10, "RdBu"))(256)),
          distfun   = function(x) as.dist(1-cor(t(x))), 
          hclustfun = function(x) hclust(x, method="ave"),
          Rowv=FALSE,
          Colv=TRUE,
          dendrogram = "none",
          trace="none",
          cexCol = 0.9,
          margins=c(20,7))
