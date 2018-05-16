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
sva_correctino="sva_corrected"
data$GeneName=NULL
data$GeneId=NULL
data.pca=prcomp(t(data),center=FALSE,scale=FALSE)
labelvals=as.character(round(100*data.pca$sdev^2/sum(data.pca$sdev^2),2))
png('genespcA_variance_explained.png')
#png('SVA_CORRECTED_genespcA_variance_explained.png')
barplot(100*data.pca$sdev^2/sum(data.pca$sdev^2),las=2,ylab="% Variance Explained",xlab="Principal Component",ylim=c(0,100))
text(1:12,100*data.pca$sdev^2/sum(data.pca$sdev^2),labels=labelvals,pos=3,cex=0.5)
dev.off() 

groups=labels$Description
mac_vs_sat_groups=labels$CellType 
time_groups=labels$Day 
treatment_groups=labels$Treatment 
rep_groups=labels$Replicates
png(filename = paste(sva_correction,"pc1_vspc2_all_nemo.png",sep=""),height=10, width=10, units='in', res=300)
plot(data.pca$x[,c(1,2)],col=c25[rep_groups],pch=16)
text(data.pca$x[,c(1,2)],labels=groups,pos=3,cex=0.5)
title("PC1 vs PC2")
dev.off() 

png(filename = paste(sva_correction,"pc1_vspc3_all_nemo.png",sep=""),height=10, width=10, units='in', res=300)
plot(data.pca$x[,c(1,3)],col=c25[rep_groups],pch=16)
text(data.pca$x[,c(1,3)],labels=groups,pos=3,cex=0.5)
title("PC1 vs PC3")
dev.off() 

png(filename = paste(sva_correction,"pc2_vspc3_all_nemo.png",sep=""),height=10, width=10, units='in', res=300)
plot(data.pca$x[,c(2,3)],col=c25[rep_groups],pch=16)
text(data.pca$x[,c(2,3)],labels=groups,pos=3,cex=0.5)
title("PC2 vs PC3")
dev.off() 

png(filename = paste(sva_correction,"pc2_vspc4_all_nemo.png",sep=""),height=10, width=10, units='in', res=300)
plot(data.pca$x[,c(2,4)],col=c25[rep_groups],pch = 16)
text(data.pca$x[,c(2,4)],labels=groups,pos=3,cex=0.5)
title("PC2 vs PC4")
dev.off() 

png(filename = paste(sva_correction,"pc2_vspc5_all_nemo.png",sep=""),height=10, width=10, units='in', res=300)
plot(data.pca$x[,c(2,5)],col=c25[rep_groups],pch = 16)
text(data.pca$x[,c(2,5)],labels=groups,pos=3,cex=0.5)
title("PC2 vs PC5") 
dev.off() 

#################################### JUST sat ##############################################
sat=subset(data,select=c("Day0_Sat_1","Day0_Sat_2","Day0_Sat_3","Day0_Sat_4",
                         "Day2_Sat_1","Day2_Sat_2","Day2_Sat_3","Day2_Sat_4",
                         "Day4_Sat_1","Day4_Sat_2","Day4_Sat_3","Day4_Sat_4",
                         "Day7_Sat_1","Day7_Sat_2","Day7_Sat_3","Day7_Sat_4"))

sat.pca=prcomp(t(sat),center=FALSE,scale=FALSE)
labelvals=as.character(round(100*sat.pca$sdev^2/sum(sat.pca$sdev^2),2))
png('genespcA_variance_explained_sat_only.png') 
barplot(100*sat.pca$sdev^2/sum(sat.pca$sdev^2),las=2,ylab="% Variance Explained",xlab="Principal Component for sat",ylim=c(0,100))
text(1:12,100*sat.pca$sdev^2/sum(sat.pca$sdev^2),labels=labelvals,pos=3,cex=0.5)
dev.off() 

labels_sat=labels[labels$CellType=="Sat",]
groups=labels_sat$Description
time_groups=labels_sat$Day
rep_groups=labels_sat$Replicates

png(filename = paste(sva_correction,"pc1_vspc2_sat_nemo.png",sep=""),height=10, width=10, units='in', res=300)
plot(sat.pca$x[,c(1,2)],col=c25[rep_groups],pch=16)
text(sat.pca$x[,c(1,2)],labels=groups,pos=3,cex=0.5)
title("PC1 vs PC2 sat ONLY")
dev.off() 

png(filename = paste(sva_correction,"pc1_vspc3_sat_nemo.png",sep=""),height=10, width=10, units='in', res=300)
plot(sat.pca$x[,c(1,3)],col=c25[rep_groups],pch=16)
text(sat.pca$x[,c(1,3)],labels=groups,pos=3,cex=0.5)
title("PC1 vs PC3 sat ONLY")
dev.off() 

png(filename = paste(sva_correction,"pc2_vspc3_sat_nemo.png",sep=""),height=10, width=10, units='in', res=300)
plot(sat.pca$x[,c(2,3)],col=c25[rep_groups],pch=16)
text(sat.pca$x[,c(2,3)],labels=groups,pos=3,cex=0.5)
title("PC2 vs PC3 sat ONLY")
dev.off() 
#################################### JUST MACS ##############################################
MACS=subset(data,select=c("Day0_Mac_1","Day0_Mac_2","Day0_Mac_3","Day0_Mac_4",
                         "Day2_Mac_1","Day2_Mac_2","Day2_Mac_3","Day2_Mac_4",
                         "Day4_Mac_1","Day4_Mac_2","Day4_Mac_3","Day4_Mac_4",
                         "Day7_Mac_1","Day7_Mac_2","Day7_Mac_3","Day7_Mac_4"))
MACS.pca=prcomp(t(MACS),center=FALSE,scale=FALSE)
labelvals=as.character(round(100*MACS.pca$sdev^2/sum(MACS.pca$sdev^2),2))
png('genespcA_variance_explained_MACS_only.png') 
barplot(100*MACS.pca$sdev^2/sum(MACS.pca$sdev^2),las=2,ylab="% Variance Explained",xlab="Principal Component for MACS",ylim=c(0,100))
text(1:12,100*MACS.pca$sdev^2/sum(MACS.pca$sdev^2),labels=labelvals,pos=3,cex=0.5)
dev.off() 

labels_mac=labels[labels$CellType=="Mac",]
groups=labels_mac$Description
time_groups=labels_mac$Day
rep_groups=labels_mac$Replicates 

png(filename = paste(sva_correction,"pc1_vspc2_mac_nemo.png",sep=""),height=10, width=10, units='in', res=300)
plot(MACS.pca$x[,c(1,2)],col=c25[rep_groups],pch=16)
text(MACS.pca$x[,c(1,2)],labels=groups,pos=3,cex=0.5)
title("PC1 vs PC2 MACS ONLY")
dev.off() 

png(filename = paste(sva_correction,"pc1_vspc3_mac_nemo.png",sep=""),height=10, width=10, units='in', res=300)
plot(MACS.pca$x[,c(1,3)],col=c25[rep_groups],pch=16)
text(MACS.pca$x[,c(1,3)],labels=groups,pos=3,cex=0.5)
title("PC1 vs PC3 MACS ONLY")
dev.off() 

png(filename = paste(sva_correction,"pc2_vspc3_mac_nemo.png",sep=""),height=10, width=10, units='in', res=300)
plot(MACS.pca$x[,c(2,3)],col=c25[rep_groups],pch=16)
text(MACS.pca$x[,c(2,3)],labels=groups,pos=3,cex=0.5)
title("PC2 vs PC3 MACS ONLY")
dev.off() 