rm(list=ls())
library(devtools)
library(Biobase)
library(sva)
library(bladderbatch)
library(snpStats)
library(data.table)
data=data.frame(read.table('RSEM.genes.fpkm.gt1.tsv',header=TRUE,sep='\t'))
data$GeneId=NULL
data$GeneName=NULL
data=asinh(data)
#data[data>200]=1 #remove any outliers!!
batches=data.frame(read.table('batches.txt',header=TRUE,sep='\t'))
batches$Day=factor(batches$Day)
mod=model.matrix(~CellType+Day+CellType*Day,data=batches)
mod0=model.matrix(~1,data=batches)
groups=factor(names(data))
data=as.matrix(data)
sva1 = sva(data,mod,mod0,method="irw")
sur_var=sva1$sv
#we appear to be finding 7 surrogate variables 
plot(sur_var[,1],sur_var[,2],pch=16)
text(sur_var[,1],sur_var[,2],labels=groups,pos=3,cex=1)
title("Surrogate Var 1 vs Surrogate Var 2")


plot(sur_var[,1],sur_var[,3],pch=16)
text(sur_var[,1],sur_var[,3],labels=groups,pos=3,cex=0.5)
title("Var 1 vs Var 3")


plot(sur_var[,1],sur_var[,4],pch=16)
text(sur_var[,1],sur_var[,4],labels=groups,pos=3,cex=0.5)
title("Var 1 vs Var 4")


plot(sur_var[,2],sur_var[,3],pch=16)
text(sur_var[,2],sur_var[,3],labels=groups,pos=3,cex=0.5)
title("Var 2 vs Var 3")

plot(sur_var[,2],sur_var[,4],pch=16)
text(sur_var[,2],sur_var[,4],labels=groups,pos=3,cex=0.5)
title("Var 2 vs Var 4")


plot(sur_var[,3],sur_var[,4],pch=16)
text(sur_var[,3],sur_var[,4],labels=groups,pos=3,cex=0.5)
title("Var 3 vs Var 4")

summary(lm(sur_var ~ batches$CellType))
summary(lm(sur_var ~ batches$Day))

full.model.sv=cbind(mod,sur_var[,2:7])
library(limma)
fit <- lmFit(data, full.model.sv)
sv_contribs=coefficients(fit)[,c(5,6,7,8,9,10)] %*% t(fit$design[,c(5,6,7,8,9,10)])
data_corrected=data-sv_contribs
write.csv(data_corrected,"rnaseq_fpkm_corrected.csv")

spearman_cor=cor(data,method="spearman")
pearson_cor=cor(data,method="pearson")

