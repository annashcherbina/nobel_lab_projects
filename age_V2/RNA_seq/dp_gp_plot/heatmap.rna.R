rm(list=ls())
library(gplots)
data=read.table("zscores_cluster_specific_diff_genes_reps_averaged.csv",header=TRUE,sep='\t',stringsAsFactors = FALSE,row.names=3)
data$Cluster=NULL
data$newCluster=NULL
data=as.matrix(data)


require(gtools)
require(RColorBrewer)
cols <- colorRampPalette(brewer.pal(10, "RdBu"))(256)

distCor <- function(x) as.dist(1-cor(t(x)))
hclustAvg <- function(x) hclust(x, method="average")

cur_h=heatmap.2(data, 
          trace="none", 
          scale="none", 
          Rowv=FALSE,
          Colv=FALSE,
          distfun=distCor, 
          hclustfun=hclustAvg, 
          col=rev(cols), 
          labRow="",
          dendrogram="none",
          main="Differential Genes n=8323",
          symbreak=FALSE,
          colsep=c(0,3,5,7,9,11),
          sepcolor='#000000',
          margins=c(15,10))
