rm(list=ls())
library(ggplot2,quietly = TRUE)
library(dplyr,quietly = TRUE)
library(plyr,quietly = TRUE)
library(gplots,quietly=TRUE)
source("~/helpers.R")
#averages
d0=read.table("d0.ave.hmap.inputs",header=TRUE,row.names = 1,sep='\t')
d3=read.table("d3.ave.hmap.inputs",header=TRUE,row.names = 1,sep='\t')
d7=read.table("d7.ave.hmap.inputs",header=TRUE,row.names = 1,sep='\t')
#svg("d0.ave.svg",width=15,height=15)
heatmap.2(as.matrix(log2(d0)),
          Rowv=TRUE,
          Colv=TRUE,
          col=bluered(50),
          dendrogram = "none",
          density.info = "none",
          trace="none",
          scale="none",
          xlab  = "",
          ylab="",
          main='d0',
          margins=c(10,10),
          cexRow = 0.5,
          cexCol = 0.5)

heatmap.2(as.matrix(log2(d3)),
          Rowv=TRUE,
          Colv=TRUE,
          col=bluered(50),
          dendrogram = "none",
          density.info = "none",
          trace="none",
          scale="none",
          xlab  = "",
          ylab="",
          main='d3',
          margins=c(10,10),
          cexRow = 0.5,
          cexCol = 0.5)

heatmap.2(as.matrix(log2(d7)),
          Rowv=TRUE,
          Colv=TRUE,
          col=bluered(50),
          dendrogram = "none",
          density.info = "none",
          trace="none",
          scale="none",
          xlab  = "",
          ylab="",
          main='d7',
          margins=c(10,10),
          cexRow = 0.5,
          cexCol = 0.5)

