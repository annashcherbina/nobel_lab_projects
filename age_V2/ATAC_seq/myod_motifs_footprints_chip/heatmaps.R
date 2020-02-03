rm(list=ls())
rna=read.table("RNA_transformed_tpm_minus_sva_contribs.cobinders.txt",header=TRUE,sep='\t',row.names=1)
motifs=read.table("sig.cobinders.txt",header=TRUE,sep='\t',row.names=1)
library(gplots)
require(gtools)
require(RColorBrewer)
cols <- colorRampPalette(brewer.pal(10, "RdBu"))(256)

distCor <- function(x) as.dist(1-cor(t(x)))
hclustAvg <- function(x) hclust(x, method="average")

heatmap.2(as.matrix(rna), 
                trace="none", 
                col=cols,
                scale="row", 
                Rowv=TRUE,
                Colv=FALSE,
                distfun=distCor, 
                hclustfun=hclustAvg, 
                dendrogram="none",
                main="Myod1 co-binders (Expression)",
                symbreak=FALSE)

motifs[motifs==0]=1e-400
motifs=-1*log10(motifs)
motifs[motifs>400]=400
heatmap.2(as.matrix(motifs), 
          trace="none", 
          col=cols,
          scale="row", 
          Rowv=TRUE,
          Colv=FALSE,
          distfun=distCor, 
          hclustfun=hclustAvg, 
          dendrogram="none",
          main="Myod1 co-binders (Motif -log10 P-val)",
          symbreak=FALSE)