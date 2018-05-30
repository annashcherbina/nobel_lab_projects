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

data=data.frame(read.table('age.atac.counts.txt',header=TRUE,sep='\t'))
data$Chrom=NULL
data$Start=NULL 
data$End=NULL
#REMOVE DAY 21 WT & KO FOR AGE ANALYSIS 
#data=data[,c(seq(1,10),seq(15,33))]
batches=data.frame(read.table("batches.atac.txt",header=TRUE,sep='\t',row.names = 1))
#batches=batches[c(seq(1:10),seq(15,33)),]
batches$Day=factor(batches$Day)
batches$Age=factor(batches$Age)
#batches$KO=factor(batches$KO)

mod0=model.matrix(~1,data=batches)
mod1=model.matrix(~ Day+Age,data=batches)
v=voom(counts=data,design=mod1)
sva.obj=sva(v$E,mod1,mod0,method="irw")
sur_var=sva.obj$sv
summary(lm(sva.obj$sv ~ batches$Age+batches$Day))
full.design.sv=cbind(mod1,sur_var)
v=voom(counts=data,design=full.design.sv)
fit <- lmFit(v)
sv_contribs=coefficients(fit)[,6:17] %*% t(fit$design[,6:17])
v$E=v$E-sv_contribs
filtered=v$E

spearman_cor=cor(v$E,method="spearman")
write.csv(spearman_cor,"atac.spearman_cor.csv")
pearson_cor=cor(v$E,method="pearson")
write.csv(pearson_cor,"atac.pearson_cor.csv")

data.pca=prcomp(t(v$E),scale=FALSE,center=FALSE)
var_explained=as.character(round(100*data.pca$sdev^2/sum(data.pca$sdev^2),2))

png('atac.varexplained.png',height=10,width=10,units='in',res=300)
barplot(100*data.pca$sdev^2/sum(data.pca$sdev^2),las=2,ylab="% Variance Explained",xlab="Principal Component",ylim=c(0,100))
text(1:12,100*data.pca$sdev^2/sum(data.pca$sdev^2),labels=var_explained,pos=3,cex=1)
dev.off() 

day_labels=batches[rownames(data.pca$x),]$Day
age_labels=batches[rownames(data.pca$x),]$Age

png(filename = "age.atac.pca.1vs2.png",height=10, width=10, units='in', res=300)
plot(data.pca$x[,c(1,2)],col=c25[day_labels],pch=16)
text(data.pca$x[,c(1,2)],labels=rownames(data.pca$x),pos=3, cex=1)
title("PC1 vs PC2")
dev.off() 
png(filename = "age.atac.pca.2vs3.png",height=10, width=10, units='in', res=300)
plot(data.pca$x[,c(2,3)],col=c25[day_labels],pch=16)
text(data.pca$x[,c(2,3)],labels=rownames(data.pca$x),pos=3, cex=1)
title("PC2 vs PC3")
dev.off() 
png(filename = "age.atac.pca.1vs3.png",height=10, width=10, units='in', res=300)
plot(data.pca$x[,c(1,3)],col=c25[day_labels],pch=16)
text(data.pca$x[,c(1,3)],labels=rownames(data.pca$x),pos=3, cex=1)
title("PC1 vs PC3")
dev.off() 


fit <- lmFit(filtered,design = mod1)
