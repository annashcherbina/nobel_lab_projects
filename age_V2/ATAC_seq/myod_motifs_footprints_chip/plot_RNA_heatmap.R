rm(list=ls())
library(dplyr)
library(tidyr)
data=read.table("RNA_transformed_tpm_minus_sva_contribs.txt",header=TRUE,sep='\t')
data$ens_gene=rownames(data)

data=data %>%separate("ens_gene",c("ens","gene"),"_")
genes_to_keep=c("Myf5","Tcf12","Tcf21","Tfap4","Myog","Atoh1","Ascl1","Ptf1a","Olig2","Zbtb18","Neurod1","Prdm16","Tbx5","Tcf3","E2f1","Tcf4")
subset=data[data$gene %in% genes_to_keep,]
d0_A=rowMeans(subset[grepl("^d0_A",names(subset))])
d0_Y=rowMeans(subset[grepl("^d0_Y",names(subset))])

d1_A=rowMeans(subset[grepl("^d1_A",names(subset))])
d1_Y=rowMeans(subset[grepl("^d1_Y",names(subset))])

d3_A=rowMeans(subset[grepl("^d3_A",names(subset))])
d3_Y=rowMeans(subset[grepl("^d3_Y",names(subset))])

d5_A=rowMeans(subset[grepl("^d5_A",names(subset))])
d5_Y=rowMeans(subset[grepl("^d5_Y",names(subset))])

d7_A=rowMeans(subset[grepl("^d7_A",names(subset))])
d7_Y=rowMeans(subset[grepl("^d7_Y",names(subset))])
genes=subset$gene
subset=cbind(d0_A,d0_Y,d1_A,d1_Y,d3_A,d3_Y,d5_A,d5_Y,d7_A,d7_Y)
rownames(subset)=genes
subset=subset[rowSums(subset)>1,]
#make heatmap 
library(gplots)
require(gtools)
require(RColorBrewer)
cols <- rev(colorRampPalette(brewer.pal(10, "RdBu"))(256))

distCor <- function(x) as.dist(1-cor(t(x)))
hclustAvg <- function(x) hclust(x, method="average")

heatmap.2(as.matrix(subset), 
          trace="none", 
          density.info = 'none',
          col=cols,
          scale="row", 
          Rowv=TRUE,
          Colv=FALSE,
          distfun=distCor, 
          hclustfun=hclustAvg, 
          dendrogram="none",
          main="Myod1 co-binders (Expression)",
          symbreak=FALSE)


