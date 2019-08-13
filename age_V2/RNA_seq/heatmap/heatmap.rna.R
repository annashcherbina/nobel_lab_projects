rm(list=ls())
library(gplots)
data=read.table("diff_genes_reps_averaged.tsv.with_Pax7",header=TRUE,sep='\t',stringsAsFactors = FALSE,row.names=1)
data2=subset(data,select=c(1,3,4,6,8,10,2,5,7,9,11))
data=as.matrix(data)
data2=as.matrix(data2)

require(gtools)
require(RColorBrewer)
cols <- colorRampPalette(brewer.pal(10, "RdBu"))(256)

distCor <- function(x) as.dist(1-cor(t(x)))
hclustAvg <- function(x) hclust(x, method="average")

cur_h=heatmap.2(data, 
          trace="none", 
          scale="row", 
          Rowv=TRUE,
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
heatmap_order=t(cur_h$carpet)
heatmap_order=heatmap_order[dim(heatmap_order)[1]:1,]
write.csv(heatmap_order,file="rna_heatmap_values.grouped_by_day.txt",quote=FALSE,sep='\t')


cur_h=heatmap.2(data2, 
          trace="none", 
          scale="row", 
          Rowv=TRUE,
          Colv=FALSE,
          distfun=distCor, 
          hclustfun=hclustAvg, 
          col=rev(cols), 
          labRow="",
          dendrogram="none",
          symbreak=FALSE,
          main="Differential Genes n=8323",
          colsep=c(0,6,11),
          sepcolor='#000000',
          margins=c(15,10))

heatmap_order=t(cur_h$carpet)
heatmap_order=heatmap_order[dim(heatmap_order)[1]:1,]
write.csv(heatmap_order,file="rna_heatmap_values.gruped_by_age.txt",quote=FALSE,sep='\t')



cur_h=heatmap.2(data2, 
                trace="none", 
                scale="row", 
                Rowv=TRUE,
                Colv=TRUE,
                distfun=distCor, 
                hclustfun=hclustAvg, 
                col=rev(cols), 
                labRow="",
                dendrogram="none",
                symbreak=FALSE,
                main="Differential Genes n=8323",
                margins=c(15,10))

heatmap_order=t(cur_h$carpet)
heatmap_order=heatmap_order[dim(heatmap_order)[1]:1,]
write.csv(heatmap_order,file="rna_heatmap_values.cluster_both_axes.txt",quote=FALSE,sep='\t')
