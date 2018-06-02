rm(list=ls())
data=read.table("differential.age.rna.counts.lncRNA.tpm",header=TRUE,sep='\t',stringsAsFactors = FALSE,row.names=1)
data$GeneName=NULL
#data=asinh(data)
data2=subset(data,select=c(1,3,5,7,9,2,4,6,8,10))
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
          zlim=c(-3,3), 
          Rowv=TRUE,
          Colv=FALSE,
          distfun=distCor, 
          hclustfun=hclustAvg, 
          col=rev(cols), 
          labRow="",
          dendrogram="none",
          symbreak=FALSE,
          colsep=c(0,2,4,6,8,10),
          sepcolor='#000000')
heatmap_order=t(cur_h$carpet)
heatmap_order=heatmap_order[dim(heatmap_order)[1]:1,]
write.csv(heatmap_order,file="rna_heatmap_values.1.txt",quote=FALSE,sep='\t')


cur_h=heatmap.2(data2, 
          trace="none", 
          scale="row", 
          zlim=c(-3,3), 
          Rowv=TRUE,
          Colv=FALSE,
          distfun=distCor, 
          hclustfun=hclustAvg, 
          col=rev(cols), 
          labRow="",
          dendrogram="none",
          symbreak=FALSE,
          colsep=c(0,5,10),
          sepcolor='#000000')

heatmap_order=t(cur_h$carpet)
heatmap_order=heatmap_order[dim(heatmap_order)[1]:1,]
write.csv(heatmap_order,file="rna_heatmap_values.2.txt",quote=FALSE,sep='\t')
