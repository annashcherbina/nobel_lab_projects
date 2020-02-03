rm(list=ls())
data=read.table("RSEM.genes.fpkm.gt1.noGm.averagedreps.differential.tf.tsv",header=TRUE,sep='\t')
header="Satellite Cells time course \n FPKM for Differential Transcription Factors"
library(gplots)
data$GeneId=NULL
GeneName=data$GeneName
data$GeneName=NULL
data=as.matrix(data)
hclust_fun = function(x) hclust(x, method="complete")
dist_fun = function(x) dist(x, method="manhattan")
png('differentital_transcription_factors.png',height=10,width=10,units='in',res=600)
heatmap.2(as.matrix(data),
          col=greenred(30),
          distfun=dist_fun,
          hclustfun = hclust_fun,
          Rowv=TRUE,
          Colv=FALSE,
          density.info="none",
          labRow="330 TF's",
          scale="row",
          trace="none",
          dendrogram = "none",
          margins=c(10,10),
          cexRow = 1,
          main=header)
dev.off() 
