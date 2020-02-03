rm(list=ls())
library(ggplot2)
library(gplots)
sat_data=read.table("heatmap_inputs_sat.txt",header=TRUE,sep='\t')
mac_data=read.table("heatmap_inputs_mac.txt",header=TRUE,sep='\t')
mac_sat_data=data.frame(read.table("heatmap_inputs_sat_mac.txt",header=TRUE,sep='\t'))

#heatmap for Sat cells
# sat_genes=sat_data$Gene
# sat_data$Gene=NULL
# heatmap.2(as.matrix(sat_data),
#             cexCol=1,
#             col=redblue(30),
#             Colv=FALSE,
#             Rowv=TRUE,
#             density.info="none",
#             scale="none",
#             trace="none",
#             labRow="",
#             margins=c(15,10),
#             main="Differentially Expressed Genes in Sat Cells")

#heatmap for Mac cells 
# mac_genes=mac_data$Gene
# mac_data$Gene=NULL
# heatmap.2(as.matrix(mac_data),
#           cexCol=1,
#           col=redblue(30),
#           Colv=FALSE,
#           Rowv=TRUE,
#           density.info="none",
#           scale="none",
#           trace="none",
#           labRow="",
#           margins=c(15,10),
#           main="Differentially Expressed Genes in Mac Cells")

#heatmap for combined Mac and Sat cells together 
mac_sat_genes=mac_sat_data$Gene
mac_sat_data$Gene=NULL
heatmap.2(as.matrix(mac_sat_data),
          cexCol=1,
          col=redblue(30),
          Colv=FALSE,
          Rowv=TRUE,
          density.info="none",
          scale="row",
          trace="none",
          labRow="",
          margins=c(15,10),
          main="Differentially Expressed \n Genes in Sat. and Mac. Cells")