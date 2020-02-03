rm(list=ls())
#all the heatmaps! 
#data=read.table("RSEM.genes.fpkm.gt1.noGm.averagedreps.differential.tsv",header=TRUE,sep='\t')
data=read.table("RSEM.genes.fpkm.gt1.noGm.averagedreps.differential.tsv",header=TRUE,sep='\t')
header="Satellite Cells time course \n FPKM for Differentially Expressed Genes"
#data=read.table("FOLD.CHANGE.rsem.fpkm.gt1.noGm.averagedreps.differential.tsv",header=TRUE,sep='\t')
#header="Satellite Cells time course \n Fold Change KO/WT for Differentially Expressed Genes"
library(gplots)
data$GeneId=NULL
GeneName=data$GeneName
data$GeneName=NULL
data=as.matrix(data)
hclust_fun = function(x) hclust(x, method="complete")
dist_fun = function(x) dist(x, method="manhattan")
png('RSEM.genes.fpkm.gt1.noGm.averagedreps.differential.png',height=10,width=10,units='in',res=600)
#png('FOLD.CHANGE.rsem.fpkm.gt1.noGm.averagedreps.differential.png',height=10,width=10,units='in',res=600)
heatmap.2(as.matrix(data),
          col=greenred(30),
          distfun=dist_fun,
          hclustfun = hclust_fun,
          Rowv=TRUE,
          Colv=FALSE,
          density.info="none",
          labRow="5,289 genes",
          scale="row",
          trace="none",
          dendrogram = "none",
          margins=c(10,10),
          cexRow = 1,
          main=header)
dev.off() 
