rm(list=ls())
library(limma)
library(edgeR)
library(devtools)
library(Biobase)
library(sva)
library(bladderbatch)
library(snpStats)
library(data.table)
data=data.frame(read.table('RSEM.genes.expected_count.gt1.noGm.csv',header=TRUE,sep='\t'))
gene_ids=data$GeneId
gene_names=data$GeneName
data$GeneId=NULL
data$GeneName=NULL
rownames(data)=paste(gene_ids,gene_names,sep="_")
#select just the columns for Day, Treatment 
batches_full=data.frame(read.table('batches.txt',header=TRUE,sep='\t'))
batches_full$Day=factor(batches_full$Day)
print(names(data))
print(batches_full)
batches=subset(batches_full,select=c("Day","Treatment"))
f=batches_full$Replicate 
f=factor(f)
mod1=model.matrix(~0+Replicate,data=batches_full)
v=voom(counts=data,design=mod1)
fit <- lmFit(v)
#cont.matrix=makeContrasts(Day2SatWT_vs_Day0SatWT="ReplicateDay2_Sat_WT-ReplicateDay0_Sat_WT",
#                          Day4SatWT_vs_Day2SatWT="ReplicateDay4_Sat_WT-ReplicateDay2_Sat_WT",
#                          Day7SatWT_vs_Day4SatWT="ReplicateDay7_Sat_WT-ReplicateDay4_Sat_WT",
#                          Day0SatWT_vs_Day0SatKO="ReplicateDay0_Sat_WT-ReplicateDay0_Sat_KO",
#                          Day2SatWT_vs_Day2SatKO="ReplicateDay2_Sat_WT-ReplicateDay2_Sat_KO",
#                          Day4SatWT_vs_Day4SatKO="ReplicateDay4_Sat_WT-ReplicateDay4_Sat_KO",
#                          Day7SatWT_vs_Day7SatKO="ReplicateDay7_Sat_WT-ReplicateDay7_Sat_KO",
#                          levels=mod1)
cont.matrix=makeContrasts(Day0SatKO_vs_Day0SatWT="ReplicateDay0_Sat_KO-ReplicateDay0_Sat_WT",
                          Day2SatKO_vs_Day2SatWT="ReplicateDay2_Sat_KO-ReplicateDay2_Sat_WT",
                          Day4SatKO_vs_Day4SatWT="ReplicateDay4_Sat_KO-ReplicateDay4_Sat_WT",
                          Day7SatKO_vs_Day7SatWT="ReplicateDay7_Sat_KO-ReplicateDay7_Sat_WT",
                          levels=mod1)

fit2=contrasts.fit(fit,cont.matrix)
e=eBayes(fit2)
comparisons=colnames(cont.matrix)
gene_names=unlist(strsplit(rownames(data),'_'))[seq(from=2,to=nrow(data),by=2)]
for(i in seq(1,4))
{
tab<-topTable(e, number=nrow(data),coef=i,lfc=1,p.value = 0.05)
if(nrow(tab)>0)
{
names(tab)[1]=comparisons[i]
}
tab$Gene=rownames(tab)
write.table(tab,file=paste("differential_genes_",comparisons[i],".tsv",sep=""),quote=TRUE,sep='\t',row.names = FALSE)
png(paste("volcano_",comparisons[i],".png",sep=""))
volcanoplot(e,coef=i,highlight = 10,names=gene_names,main=comparisons[i])
dev.off() 
}
results=decideTests(e,p.value=0.05,lfc=1)
vennDiagram(results,include=c("up","down"),counts.col=c("red","green"))

for(i in seq(1,4))
{
  #tab<-topTable(e, number=nrow(data),coef=i,p.value = 0.05,lfc=1)
  tab<-topTable(e, number=nrow(data),coef=i)
  tab$Gene=rownames(tab)
  write.table(tab,file=paste("All",comparisons[i],".tsv",sep=""),quote=FALSE,sep='\t',row.names=FALSE)
  #filter to just the up-regulated and down-regulated genes 
  #up_wt=tab$Gene[tab$logFC>=0]
  #up_wt=unlist(strsplit(up_wt,'_'))[seq(from=2,to=length(up_wt),by=2)]
  #down_wt=tab$Gene[tab$logFC<=0]
  #down_wt=unlist(strsplit(down_wt,'_'))[seq(from=2,to=length(down_wt),by=2)]
  #write.table(up_wt,file=paste("UpWT",comparisons[i],".tsv",sep=""),quote=FALSE,sep='\t',row.names=FALSE)
  #write.table(down_wt,file=paste("DownWT",comparisons[i],".tsv",sep=""),quote=FALSE,sep='\t',row.names=FALSE)
}