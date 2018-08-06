rm(list=ls())
library(ggplot2)
#library(ggbiplot)
library(sva)
library(data.table)
library(limma)
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

data=data.frame(read.table('../age.atac.counts.txt.filtered',header=TRUE,sep='\t'))
rownames(data)=paste(data$Chrom,data$Start,data$End,sep="_")
data$Chrom=NULL
data$Start=NULL 
data$End=NULL
batches=data.frame(read.table("../batches.atac.txt.filtered",header=TRUE,sep='\t'))
rownames(batches)=batches$Replicate
batches$Day=factor(batches$Day)
batches$Age=factor(batches$Age)
batches$Sample=factor(batches$Sample)
batches$Batch=factor(batches$Batch)

mod1=model.matrix(~0+Sample,data=batches)
v=voom(counts=data,design=mod1)
fit <- lmFit(v)
batch_contribs=coefficients(fit)[,7:9] %*% t(fit$design[,7:9])
filtered=v$E-batch_contribs
spearman_cor=cor(v$E,method="spearman")
write.csv(spearman_cor,"atac.spearman_cor.csv")
pearson_cor=cor(v$E,method="pearson")
write.csv(pearson_cor,"atac.pearson_cor.csv")

data.pca=prcomp(t(v$E),center=FALSE,scale=FALSE)
var_explained=as.character(round(100*data.pca$sdev^2/sum(data.pca$sdev^2),2))

barplot(100*data.pca$sdev^2/sum(data.pca$sdev^2),las=2,ylab="% Variance Explained",xlab="Principal Component",ylim=c(0,100))
text(1:12,100*data.pca$sdev^2/sum(data.pca$sdev^2),labels=var_explained,pos=3,cex=1)

day_labels=batches[rownames(data.pca$x),]$Day
age_labels=batches[rownames(data.pca$x),]$Age

plot(data.pca$x[,c(1,2)],col=c25[day_labels],pch=16)
text(data.pca$x[,c(1,2)],labels=rownames(data.pca$x),pos=3, cex=1)
title("PC1 vs PC2")

plot(data.pca$x[,c(2,3)],col=c25[day_labels],pch=16)
text(data.pca$x[,c(2,3)],labels=rownames(data.pca$x),pos=3, cex=1)
title("PC2 vs PC3")
plot(data.pca$x[,c(1,3)],col=c25[day_labels],pch=16)
text(data.pca$x[,c(1,3)],labels=rownames(data.pca$x),pos=3, cex=1)
title("PC1 vs PC3")


