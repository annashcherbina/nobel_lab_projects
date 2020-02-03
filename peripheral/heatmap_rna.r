library(gplots)
library(data.table)
data=data.frame(read.table('heatmap_genes_WT_and_MDX.zscores.tsv',header=T,sep='\t'))
rownames=data$GeneName
#data$GeneID=NULL
data$GeneName=NULL
#data$sd=NULL
#data$mean=NULL
#data$delta=NULL
#x=as.matrix(na.omit(log2(data)))
#x[!is.finite(x)] <- 0
x=as.matrix(data)
#my_palette<-colorRampPalette(c("#00BF41", "#00C207","#33C600","#71CA00","#B1CE00","#D2B000","#D57300","#D93400","#DD000D","#E10050","#E50097"))(n=109)
#my_palette <- colorRampPalette(c("#0072B2", "#009E73", "#F0E442","#E69F00","#D55E00"))(n = 59)
my_palette=colorRampPalette(c('#0000FF','#FF0000'))(n=69)
colors = c(seq(0,5,length=40),
           seq(6,10,length=10),
           seq(11,20,length=5),
           seq(21,50,length=5),
           seq(51,100,length=2),
           seq(101,250,length=2),
           seq(251,1000,length=2),
           seq(1001,2000,length=2),
           seq(2001,5000,length=2)
          )
#png('heatmap_lncRNA_genes.png',height=10,width=8,units = "in",res=300)
h=heatmap.2(x,
          Colv = FALSE,
          Rowv=FALSE,
          dendrogram=c("column"),
          cexCol=1,
          col=bluered(30),
          trace="none",
          scale="none",
          density.info="none",
          labRow="",
          margins=c(10,5),
          main="Z-score of FPKM for Differential Genes")
#dev.off() 