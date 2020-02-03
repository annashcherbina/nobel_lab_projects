rm(list=ls())
library(limma)
library(sva)
library(data.table)

#Read in the counts data 
data=data.frame(read.table('counts.txt',header=TRUE,sep='\t'))
chrom=data$Chrom
start_pos=data$Start
end_pos=data$End
unique_names=paste(chrom,start_pos,end_pos,sep="_")
data$Chrom=NULL
data$Start=NULL
data$End=NULL
rownames(data)=unique_names
#Read in the batches data 
batches=data.frame(read.table('batches.txt',header=TRUE,sep='\t'))

#Transfor raw counts to logCPM 
data=voom(data)

#Perform PCA 
data.pca=prcomp(t(data),center=FALSE,scale=FALSE)
barplot(100*data.pca$sdev^2/sum(data.pca$sdev^2),las=2,xlab="",ylab="% Variance Explained")
library(ggplot2)
library(RColorBrewer)
ggplot(data=as.data.frame(data.pca$x),
       aes(x=data.pca$x[,1],
           y=data.pca$x[,2],
           color=batches$Description,
           label=batches$Description))+
         geom_point(size=10)+
  geom_label()+
         scale_color_manual(values=c("#ff0000","#ff0000","#00ff00","#00ff00","#0000ff","#0000ff","#000000","#000000","#ffff00"))+
  theme_bw(20)+
  xlab("PC1")+
  ylab("PC2")+
  theme(legend.position="none")

ggplot(data=as.data.frame(data.pca$x),
       aes(x=data.pca$x[,1],
           y=data.pca$x[,3],
           color=batches$Description,
           label=batches$Description))+
  geom_point(size=10)+
  geom_label()+
  scale_color_manual(values=c("#ff0000","#ff0000","#00ff00","#00ff00","#0000ff","#0000ff","#000000","#000000","#ffff00"))+
  theme_bw(20)+
  xlab("PC1")+
  ylab("PC3")+
  theme(legend.position="none")

ggplot(data=as.data.frame(data.pca$x),
       aes(x=data.pca$x[,2],
           y=data.pca$x[,3],
           color=batches$Description,
           label=batches$Description))+
  geom_point(size=10)+
  geom_label()+
  scale_color_manual(values=c("#ff0000","#ff0000","#00ff00","#00ff00","#0000ff","#0000ff","#000000","#000000","#ffff00"))+
  theme_bw(20)+
  xlab("PC2")+
  ylab("PC3")+
  theme(legend.position="none")

#look at NEMO vs Control differential peaks 
mod=model.matrix(~0+Type,data=batches)
fit <- lmFit(data, mod)

#fit <- lmFit(v)
#plotMDS(v)

#specify the contrasts 
cont.matrix=makeContrasts(nemo_vs_control="TypeNemo-TypeControl",
                          levels=mod)
fit2=contrasts.fit(fit,cont.matrix)
e=eBayes(fit2)
differential_peaks=topTable(e, number=nrow(data),lfc=1,p.value = 0.05)
write.table(differential_peaks,file="NEMO_vs_Both_Controls.tsv",quote=FALSE,sep='\t',row.names = TRUE,col.names=TRUE)
