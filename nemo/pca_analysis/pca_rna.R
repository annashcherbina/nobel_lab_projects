rm(list=ls())
library(data.table)
library(ggplot2)
data=data.frame(read.table('../RSEM.genes.fpkm.gt1.tsv',header=TRUE,sep='\t'))
labels=data.frame(read.table('../batches_pca.txt',header=TRUE,sep='\t'))
labels$Day=factor(labels$Day)
data$GeneName=NULL
data$GeneId=NULL

data.pca=prcomp(t(data))
labelvals=as.character(round(100*data.pca$sdev^2/sum(data.pca$sdev^2),2))
barplot(100*data.pca$sdev^2/sum(data.pca$sdev^2),las=2,ylab="% Variance Explained",xlab="Principal Component",ylim=c(0,100))
text(1:12,100*data.pca$sdev^2/sum(data.pca$sdev^2),labels=labelvals,pos=3,cex=0.5)

pca_df=as.data.frame(data.pca$x)
pca_df=cbind(pca_df,labels)
pca_df$CellTypeBool=pca_df$CellType=="Mac"
p1=ggplot(data=pca_df,
       aes(x=pca_df$PC1,
           y=pca_df$PC2,
           color=pca_df$Day,
           fill=factor(ifelse(pca_df$CellTypeBool,NA,pca_df$Day)),
           shape=pca_df$Treatment))+
  geom_point(show.legend=TRUE,size=5)+
  xlab("PC1:29.41 %")+
  ylab("PC2:24.15 %")+
  scale_shape_manual(values=c(21,22),name="WT vs KO")+
  scale_color_manual(name="Day Post Injury",values=c('#e41a1c','#377eb8','#4daf4a','#984ea3'))+
  scale_fill_discrete(na.value=NA,guide="none")+
  ggtitle("Satellite Cells (Clear) and Macrophage Cells (Filled)")


p2=ggplot(data=pca_df,
          aes(x=pca_df$PC2,
              y=pca_df$PC3,
              color=pca_df$Day,
              fill=factor(ifelse(pca_df$CellTypeBool,NA,pca_df$Day)),
              shape=pca_df$Treatment))+
  geom_point(show.legend=TRUE,size=5)+
  xlab("PC2:24.15 %")+
  ylab("PC3:16.22 %")+
  scale_shape_manual(values=c(21,22),name="WT vs KO")+
  scale_color_manual(name="Day Post Injury",values=c('#e41a1c','#377eb8','#4daf4a','#984ea3'))+
  scale_fill_discrete(na.value=NA,guide="none")+
  ggtitle("Satellite Cells (Clear) and Macrophage Cells (Filled)")

p3=ggplot(data=pca_df,
          aes(x=pca_df$PC1,
              y=pca_df$PC3,
              color=pca_df$Day,
              fill=factor(ifelse(pca_df$CellTypeBool,NA,pca_df$Day)),
              shape=pca_df$Treatment))+
  geom_point(show.legend=TRUE,size=5)+
  xlab("PC1:29.41 %")+
  ylab("PC3:16.22 %")+
  scale_shape_manual(values=c(21,22),name="WT vs KO")+
  scale_color_manual(name="Day Post Injury",values=c('#e41a1c','#377eb8','#4daf4a','#984ea3'))+
  scale_fill_discrete(na.value=NA,guide="none")+
  ggtitle("Satellite Cells (Clear) and Macrophage Cells (Filled)")


#################################### JUST sat ##############################################
sat=subset(data,select=c("Day0_Sat_1","Day0_Sat_2","Day0_Sat_3","Day0_Sat_4",
                         "Day2_Sat_1","Day2_Sat_2","Day2_Sat_3","Day2_Sat_4",
                         "Day4_Sat_1","Day4_Sat_2","Day4_Sat_3","Day4_Sat_4",
                         "Day7_Sat_1","Day7_Sat_2","Day7_Sat_3","Day7_Sat_4"))

sat.pca=prcomp(t(sat))
labelvals=as.character(round(100*sat.pca$sdev^2/sum(sat.pca$sdev^2),2))
barplot(100*sat.pca$sdev^2/sum(sat.pca$sdev^2),las=2,ylab="% Variance Explained",xlab="Principal Component for sat",ylim=c(0,100))
text(1:12,100*sat.pca$sdev^2/sum(sat.pca$sdev^2),labels=labelvals,pos=3,cex=0.5)

labels_sat=labels[labels$CellType=="Sat",]
sat_pca_df=as.data.frame(sat.pca$x)
sat_pca_df=cbind(sat_pca_df,labels_sat)


p4=ggplot(data=sat_pca_df,
          aes(x=sat_pca_df$PC1,
              y=sat_pca_df$PC2,
              color=sat_pca_df$Day,
              shape=sat_pca_df$Treatment))+
  geom_point(show.legend=TRUE,size=5)+
  xlab("PC1:51.38 %")+
  ylab("PC2:28.03 %")+
  scale_shape_discrete(name="WT vs KO")+
  scale_color_manual(name="Day Post Injury",values=c('#e41a1c','#377eb8','#4daf4a','#984ea3'))+
  ggtitle("Satellite Cells")+
  theme_bw(20)

p5=ggplot(data=sat_pca_df,
          aes(x=sat_pca_df$PC2,
              y=sat_pca_df$PC3,
              color=sat_pca_df$Day,
              shape=sat_pca_df$Treatment))+
  geom_point(show.legend=TRUE,size=5)+
  xlab("PC2:28.03 %")+
  ylab("PC3:10.20 %")+
  scale_shape_discrete(name="WT vs KO")+
  scale_color_manual(name="Day Post Injury",values=c('#e41a1c','#377eb8','#4daf4a','#984ea3'))+
  ggtitle("Satellite Cells")

p6=ggplot(data=sat_pca_df,
          aes(x=sat_pca_df$PC1,
              y=sat_pca_df$PC3,
              color=sat_pca_df$Day,
              shape=sat_pca_df$Treatment))+
  geom_point(show.legend=TRUE,size=5)+
  xlab("PC1:51.38 %")+
  ylab("PC3:10.20 %")+
  scale_shape_discrete(name="WT vs KO")+
  scale_color_manual(name="Day Post Injury",values=c('#e41a1c','#377eb8','#4daf4a','#984ea3'))+
  ggtitle("Satellite Cells")


#################################### JUST MACS ##############################################
MACS=subset(data,select=c("Day0_Mac_1","Day0_Mac_2","Day0_Mac_3","Day0_Mac_4",
                         "Day2_Mac_1","Day2_Mac_2","Day2_Mac_3","Day2_Mac_4",
                         "Day4_Mac_1","Day4_Mac_2","Day4_Mac_3","Day4_Mac_4",
                         "Day7_Mac_1","Day7_Mac_2","Day7_Mac_3","Day7_Mac_4"))
MACS.pca=prcomp(t(MACS))
labelvals=as.character(round(100*MACS.pca$sdev^2/sum(MACS.pca$sdev^2),2))
barplot(100*MACS.pca$sdev^2/sum(MACS.pca$sdev^2),las=2,ylab="% Variance Explained",xlab="Principal Component for MACS",ylim=c(0,100))
text(1:12,100*MACS.pca$sdev^2/sum(MACS.pca$sdev^2),labels=labelvals,pos=3,cex=0.5)

labels_macs=labels[labels$CellType=="Mac",]
macs_pca_df=as.data.frame(MACS.pca$x)
macs_pca_df=cbind(macs_pca_df,labels_macs)

p7=ggplot(data=macs_pca_df,
          aes(x=macs_pca_df$PC1,
              y=macs_pca_df$PC2,
              color=macs_pca_df$Day,
              shape=macs_pca_df$Treatment))+
  geom_point(show.legend=TRUE,size=5)+
  xlab("PC1:45.35 %")+
  ylab("PC2:21.09 %")+
  scale_shape_discrete(name="WT vs KO")+
  scale_color_manual(name="Day Post Injury",values=c('#e41a1c','#377eb8','#4daf4a','#984ea3'))+
  ggtitle("MACS Cells")+
  theme_bw(20)

p8=ggplot(data=macs_pca_df,
          aes(x=macs_pca_df$PC2,
              y=macs_pca_df$PC3,
              color=macs_pca_df$Day,
              shape=macs_pca_df$Treatment))+
  geom_point(show.legend=TRUE,size=5)+
  xlab("PC2:21.09 %")+
  ylab("PC3:14.62 %")+
  scale_shape_discrete(name="WT vs KO")+
  scale_color_manual(name="Day Post Injury",values=c('#e41a1c','#377eb8','#4daf4a','#984ea3'))+
  ggtitle("MACS Cells")

p9=ggplot(data=macs_pca_df,
          aes(x=macs_pca_df$PC1,
              y=macs_pca_df$PC3,
              color=macs_pca_df$Day,
              shape=macs_pca_df$Treatment))+
  geom_point(show.legend=TRUE,size=5)+
  xlab("PC1:45.35 %")+
  ylab("PC3:14.62 %")+
  scale_shape_discrete(name="WT vs KO")+
  scale_color_manual(name="Day Post Injury",values=c('#e41a1c','#377eb8','#4daf4a','#984ea3'))+
  ggtitle("MACS Cells")

