rm(list=ls())
library(gplots)
require(gtools)
require(RColorBrewer)
cols <- colorRampPalette(brewer.pal(10, "RdBu"))(256)

data=read.table("RNA_transformed_tpm_minus_sva_contribs.subset.averaged.zscores.txt",header=TRUE,sep='\t')
genes=data$Gene
data$Gene=NULL
svg(filename="genes_to_highlight_3f.svg",
    height=4,
    width=6,
    pointsize=12)
cur_h=heatmap.2(as.matrix(data), 
                trace="none", 
                scale="none", 
                Rowv=TRUE,
                Colv=FALSE,
                density="none",
                col=rev(cols), 
                labRow = genes,
                dendrogram="none",
                main="")
dev.off() 
