library("DESeq2")
library("RColorBrewer")
library("gplots")
library("dplyr")
library("BiocParallel")
library("ggplot2")
library(data.table)

# Metadata

padjCutoff <- 0.05
foldChangeCutoff <- 1
register(MulticoreParam(16))
parallelFlag <- TRUE

countData=data.frame(read.table("RSEM.genes.expected_count.gt1.nobadreps.csv",header=T,sep='\t'))
countData$GeneName=NULL
countData$TranscriptID=NULL
countData$GeneID=NULL

countData=ceiling(countData) 

colData=data.frame(read.table("rsem.counts.metadata.nobadreps",header=T,sep='\t'))
colData$SampleGroup=factor(colData$SampleGroup)

#THIS IS AN EXAMPLE OF A SINGLE FACTOR ANALYSIS -- SAMPLE IS THE SINGLE INDEPENDENT VARIABLE. 
ddsIndividualFullCountTable<-DESeqDataSetFromMatrix(
	countData=countData,
	colData=colData,
	design= ~SampleGroup)
ddsIndividual<-DESeq(ddsIndividualFullCountTable,parallel=parallelFlag)
browser() 
#create matrices to store the results from the PER-SAMPLE univariate comparison
#get the individual comparisons
conditionsToCompare <- data.frame(
  matrix(
    c('WT_L', 'WT_R',
      'MDX_L', 'MDX_R',
      'MDX_L','WT_L',
      'MDX_R','WT_R'), 
    ncol = 2,
    byrow = TRUE),
  stringsAsFactors = FALSE)

numCols <- 4
numRows <- nrow(countData)
diffMat <- matrix(, ncol = numCols, nrow = numRows)
confidenceMat<-matrix(,ncol=numCols, nrow=numRows)
fcMat<-matrix(,ncol=numCols,nrow=numRows) 
diffMat<-matrix(,ncol=numCols,nrow=numRows)

colNameEntries=c()
for (i in 1:4){
  res <- results(ddsIndividual, 
                 contrast = c("SampleGroup", 
                              conditionsToCompare[i, 1], 
                              conditionsToCompare[i, 2]), 
                 parallel = parallelFlag)
  colNameEntries=append(colNameEntries,paste(conditionsToCompare[i,1],"_vs_",conditionsToCompare[i,2],sep=""))
  #plot the MAplot
  png(paste("genes_",conditionsToCompare[i,1],"_vs_",conditionsToCompare[i,2],".png",sep=""))
  plotMA(res,ylim=c(-1,1))
  dev.off() 
  confidenceMat[, i] <- res$padj
  fcMat[,i]<-res$log2FoldChange 
  diffMat[,i]<-(res$padj <= padjCutoff)*(abs(res$log2FoldChange) >=foldChangeCutoff)
}
colnames(diffMat)=colNameEntries
colnames(confidenceMat)=colNameEntries
colnames(fcMat)=colNameEntries
#diffMat[is.na(diffMat)] <- 0

# Write diffMat to disk
write.table(diffMat,file = "genes.diffMat.tsv",sep='\t')
write.table(confidenceMat,file = "genes.confidenceMat.tsv",sep='\t')
write.table(fcMat,file = "genes.fcMat.tsv",sep='\t')


#IF YOU WANT TO QC THE REPLICATES, YOU CAN PLOT RLOG-TRANSFORMED REPLICATE PAIRS AND CHECK CORRELATION
#log-transform and plot pairs of replicates
#rld<-rlog(ddsIndividual)
#browser() 
#for(i in seq(1,11,1)){
#      for(j in (seq(i+1,12,1)))
#      {
#      corval=cor(assay(rld)[,i],assay(rld)[,j])
#      corval_title=as.character(round(corval,4)) 
#      png(paste('genes',as.character(colData$Sample[i]),"_",as.character(colData$Sample[j]),".png",sep=""))
#      plot( assay(rld)[,i],assay(rld)[,j], col="#00000020", pch=20, cex=0.3, main=corval_title,xlab=colData[i,"Sample"],ylab=colData[j,"Sample"])
#      dev.off()
#     }	
#}
