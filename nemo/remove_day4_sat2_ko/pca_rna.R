rm(list=ls())
#library(ggbiplot)
library(data.table)
c25 <- c("dodgerblue2","#E31A1C", # red
         "green4",
         "#6A3D9A", # purple
         "#FF7F00", # orange
         "black","gold1",
         "skyblue2","#FB9A99", # lt pink
         "palegreen2",
         "#CAB2D6", # lt purple
         "#FDBF6F", # lt orange
         "gray70", "khaki2",
         "maroon","orchid1","deeppink1","blue1","steelblue4",
         "darkturquoise","green1","yellow4","yellow3",
         "darkorange4","brown")
data=data.frame(read.table('RSEM.genes.fpkm.gt1.tsv',header=TRUE,sep='\t'))
labels=data.frame(read.table('batches_pca.txt',header=TRUE,sep='\t'))
#data=data.frame(read.table('rnaseq_fpkm_corrected.csv',header=TRUE,sep='\t'))
sva_correction=""
data$GeneName=NULL
data$GeneId=NULL
data.pca=prcomp(t(data),center=FALSE,scale=FALSE)
labelvals=as.character(round(100*data.pca$sdev^2/sum(data.pca$sdev^2),2))
png('genespca_variance_explained.png')
#png('SVA_CORRECTED_genespcA_variance_explained.png')
barplot(100*data.pca$sdev^2/sum(data.pca$sdev^2),las=2,ylab="% Variance Explained",xlab="Principal Component",ylim=c(0,100))
text(1:12,100*data.pca$sdev^2/sum(data.pca$sdev^2),labels=labelvals,pos=3,cex=1.0)
dev.off() 

groups=labels$Description
mac_vs_sat_groups=labels$CellType 
time_groups=labels$Day 
treatment_groups=labels$Treatment 
rep_groups=labels$Replicates
png(filename = paste(sva_correction,"pc1_vspc2_sat_nemo.png",sep=""),height=10, width=10, units='in', res=300)
plot(data.pca$x[,c(1,2)],col=rep_groups,pch=16)
text(data.pca$x[,c(1,2)],labels=groups,pos=3,cex=1.0)
title("PC1 vs PC2")
dev.off() 

png(filename = paste(sva_correction,"pc1_vspc3_sat_nemo.png",sep=""),height=10, width=10, units='in', res=300)
plot(data.pca$x[,c(1,3)],col=rep_groups,pch=16)
text(data.pca$x[,c(1,3)],labels=groups,pos=3,cex=1.0)
title("PC1 vs PC3")
dev.off() 

png(filename = paste(sva_correction,"pc2_vspc3_sat_nemo.png",sep=""),height=10, width=10, units='in', res=300)
plot(data.pca$x[,c(2,3)],col=rep_groups,pch=16)
text(data.pca$x[,c(2,3)],labels=groups,pos=3,cex=1.0)
title("PC2 vs PC3")
dev.off() 

png(filename = paste(sva_correction,"pc2_vspc4_sat_nemo.png",sep=""),height=10, width=10, units='in', res=300)
plot(data.pca$x[,c(2,4)],col=rep_groups,pch = 16)
text(data.pca$x[,c(2,4)],labels=groups,pos=3,cex=1.0)
title("PC2 vs PC4")
dev.off() 

png(filename = paste(sva_correction,"pc2_vspc5_sat_nemo.png",sep=""),height=10, width=10, units='in', res=300)
plot(data.pca$x[,c(2,5)],col=rep_groups,pch = 16)
text(data.pca$x[,c(2,5)],labels=groups,pos=3,cex=1.0)
title("PC2 vs PC5") 
dev.off() 
