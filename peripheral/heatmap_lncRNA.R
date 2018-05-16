library(gplots)
library(data.table)
#data=data.frame(read.table('gene_heatmap_inputs.tsv',header=T,sep='\t'))
#lncRNA
data=data.frame(read.table('RSEM.genes.fpkm.lncRNA.tsv',header=T,sep='\t'))
rownames=data$GeneName
data$GeneID=NULL
data$GeneName=NULL
x=as.matrix(data)
png('heatmap_lncRNA_genes.png',height=15,width=8,units = "in",res=600)
heatmap.2(x,
          cexCol=1,
          col=redgreen(30),
          density.info="none",
          scale="row",
          trace="none",
          labRow=rownames,
          margins=c(10,5),
          main="lncRNA FPKM Z-scores")
dev.off() 