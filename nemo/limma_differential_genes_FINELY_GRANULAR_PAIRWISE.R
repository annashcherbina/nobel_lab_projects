rm(list=ls())
library(limma)
library(devtools)
library(Biobase)
library(sva)
library(bladderbatch)
library(snpStats)
library(data.table)
data=data.frame(read.table('RSEM.genes.expected_count.gt1.tsv',header=TRUE,sep='\t'))
gene_ids=data$GeneId
gene_names=data$GeneName
data$GeneId=NULL
data$GeneName=NULL
rownames(data)=paste(gene_ids,gene_names,sep="_")
#select just the columns for CellType, Day, Treatment 
batches_full=data.frame(read.table('batches.txt',header=TRUE,sep='\t'))
batches_full$Day=factor(batches_full$Day)
batches=subset(batches_full,select=c("CellType","Day","Treatment"))


#identify the surrogate variables! 
f=batches_full$Replicate 
f=factor(f)
mod1=model.matrix(~0+f)
#mod1=model.matrix(~CellType+Day+Treatment,data=batches)
mod0=model.matrix(~1,data=batches)
v=voom(counts=data,design=mod1)
#sva.obj=sva(v$E,mod1,mod0,method="irw")
#sur_var=sva.obj$sv
#summary(lm(sva.obj$sv ~ batches$CellType+batches$Day+batches$Treatment))
#get rid of 1,3,4,5,6,7
#full.design.sv=cbind(mod1,sur_var)
#v=voom(counts=data,design=full.design.sv)
fit <- lmFit(v)
#sv_contribs=coefficients(fit)[,c(5,7,8,9,10,11)] %*% t(fit$design[,c(5,7,8,9,10,11)])
#data=data-sv_contribs
#write.csv(data,"rnaseq_fpkm_corrected.csv")

spearman_cor=cor(data,method="spearman")
pearson_cor=cor(data,method="pearson")

#work with corrected data to get differential expression!!
#v=voom(counts=data,design=mod1)
#fit <- lmFit(v)
#e = eBayes(fit)
#make the contrasts!! 
cont.matrix=makeContrasts(Day2SatWT_vs_Day0SatWT="fDay2_Sat_WT-fDay0_Sat_WT",
                          Day4SatWT_vs_Day2SatWT="fDay4_Sat_WT-fDay2_Sat_WT",
                          Day7SatWT_vs_Day4SatWT="fDay7_Sat_WT-fDay4_Sat_WT",
                          Day2MacWT_vs_Day0MacWT="fDay2_Mac_WT-fDay0_Mac_WT",
                          Day4MacWT_vs_Day2MacWT="fDay4_Mac_WT-fDay2_Mac_WT",
                          Day7MacWT_vs_Day4MacWT="fDay7_Mac_WT-fDay4_Mac_WT",
                          Day0MacWT_vs_Day0SatWT="fDay0_Mac_WT-fDay0_Sat_WT",
                          Day2MacWT_vs_Day2SatWT="fDay2_Mac_WT-fDay2_Sat_WT",
                          Day4MacWT_vs_Day4SatWT="fDay4_Mac_WT-fDay4_Sat_WT",
                          Day7MacWT_vs_Day7SatWT="fDay7_Mac_WT-fDay7_Sat_WT",
                          Day0MacWT_vs_Day0MacKO="fDay0_Mac_WT-fDay0_Mac_KO",
                          Day2MacWT_vs_Day2MacKO="fDay2_Mac_WT-fDay2_Mac_KO",
                          Day4MacWT_vs_Day4MacKO="fDay4_Mac_WT-fDay4_Mac_KO",
                          Day7MacWT_vs_Day7MacKO="fDay7_Mac_WT-fDay7_Mac_KO",
                          Day0SatWT_vs_Day0SatKO="fDay0_Sat_WT-fDay0_Sat_KO",
                          Day2SatWT_vs_Day2SatKO="fDay2_Sat_WT-fDay2_Sat_KO",
                          Day4SatWT_vs_Day4SatKO="fDay4_Sat_WT-fDay4_Sat_KO",
                          Day7SatWT_vs_Day7SatKO="fDay7_Sat_WT-fDay7_Sat_KO",
                          levels=mod1)
fit2=contrasts.fit(fit,cont.matrix)
e=eBayes(fit2)
comparisons=colnames(cont.matrix)
gene_names=unlist(strsplit(rownames(data),'_'))[seq(from=2,to=nrow(data),by=2)]
for(i in seq(1,18))
{
tab<-topTable(e, number=nrow(data),coef=i,lfc=1,p.value = 0.05)
names(tab)[1]=comparisons[i]
tab$Gene=rownames(tab)
write.table(tab,file=paste("differential_genes_",comparisons[i],".tsv"),quote=TRUE,sep='\t',row.names = FALSE)
png(paste("volcano_",comparisons[i],".png"))
volcanoplot(e,coef=i,highlight = 10,names=gene_names,main=comparisons[i])
dev.off() 
}
