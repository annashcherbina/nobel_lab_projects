rm(list=ls())
library(limma)
data=read.table("both.H4K20me1.coverage.txt",header=1,sep='\t')
sub_data=subset(data,select=c("AgedCoverage","YoungCoverage"))
normed=as.data.frame(voom(sub_data)$E)
data$AgedCoverage=normed$AgedCoverage
data$YoungCoverage=normed$YoungCoverage
data$fc=2**(data$YoungCoverage)/2**(data$AgedCoverage)
write.table(data,'both.H4K20me1.coverage.fc.txt',sep='\t',col.names = TRUE,row.names = FALSE,quote=FALSE)