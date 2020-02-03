rm(list=ls())
library(ggplot2)
data=read.table("merged.tpm.txt",header=TRUE,sep='\t')
data$GeneID_mouse=NULL
data$GeneID_human=NULL
data$Gene=NULL

#get batches
batches=read.table('batches.goodreps.txt',header=TRUE,sep='\t')

#run PCA
data.pca=prcomp(t(data))
var_explained=as.character(round(100*data.pca$sdev^2/sum(data.pca$sdev^2),2))
barplot(100*data.pca$sdev^2/sum(data.pca$sdev^2),las=2,ylab="% Variance Explained",xlab="Principal Component",ylim=c(0,40), xlim=c(0,10))

pca_df=data.frame(data.pca$x)
pca_df=cbind(pca_df,batches)

#plot pc's 1 -3 
#options(repr.plot.width = 5, repr.plot.height = 3)
ggplot(data=pca_df,aes(x=pca_df$PC1,y=pca_df$PC2,color=pca_df$Species))+
  geom_point()+
  xlab("PC1:31.74%")+
  ylab("PC2:19.37%")


ggplot(data=pca_df,aes(x=pca_df$PC1,y=pca_df$PC2,color=pca_df$Dataset))+
  geom_point()+
  xlab("PC1:31.74%")+
  ylab("PC2:19.37%")


ggplot(data=pca_df,aes(x=pca_df$PC1,y=pca_df$PC2,color=pca_df$Day))+
  geom_point()+
  xlab("PC1:31.74%")+
  ylab("PC2:19.37%")+
  scale_color_manual(values=c('#e41a1c','#377eb8','#4daf4a','#984ea3','#ff7f00','#ffff33','#a65628','#f781bf','#999999'))


ggplot(data=pca_df,aes(x=pca_df$PC1,y=pca_df$PC2,color=pca_df$Age))+
  geom_point()+
  xlab("PC1:31.74%")+
  ylab("PC2:19.37%")+
  scale_color_manual(values=c('#1b9e77','#d95f02','#7570b3','#e7298a','#66a61e','#e6ab02'))


##original adjusted pca (mouse only)
data=read.table("RNA_transformed_tpm_minus_sva_contribs.txt",header=TRUE,sep='\t')