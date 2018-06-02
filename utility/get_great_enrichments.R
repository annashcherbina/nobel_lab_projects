rm(list=ls())
library(rGREAT)
args <- commandArgs(TRUE)
fname=args[1]
taskname=args[2]
## -------------------------------------------------------------------------------------------------
set.seed(123)
bed=read.table(fname,header=FALSE,sep='\t')
------------------------------------
job = submitGreatJob(bed,species="mm10",time_interval=30)
tb = getEnrichmentTables(job)
names(tb)
go_tables = getEnrichmentTables(job, category = c("GO"))
go_mol=go_tables[1]$`GO Molecular Function`
go_proc=go_tables[2]$`GO Biological Process`
go_cell=go_tables[3]$`GO Cellular Component`

#Apply filters on 

go_mol=go_mol[go_mol$Hyper_Adjp_BH < 0.001,]
go_mol=go_mol[go_mol$Binom_Adjp_BH < 0.001,]
go_mol=go_mol[go_mol$Binom_Fold_Enrichment>1.5,] 


go_proc=go_proc[go_proc$Hyper_Adjp_BH<0.001,]
go_proc=go_proc[go_proc$Binom_Adjp_BH<0.001,]
go_proc=go_proc[go_proc$Binom_Fold_Enrichment>1.5,]

go_cell=go_cell[go_cell$Hyper_Adjp_BH<0.001,]
go_cell=go_cell[go_cell$Binom_Adjp_BH<0.001,]
go_cell=go_cell[go_cell$Binom_Fold_Enrichment>1.5,]


pathway_tables=getEnrichmentTables(job,category=c("Pathway Data"))
panther=pathway_tables[1]$`PANTHER Pathway`
biocyc=pathway_tables[2]$`BioCyc Pathway`
msigdb=pathway_tables[3]$`MSigDB Pathway`

panther=panther[panther$Hyper_Adjp_BH<0.001,]
panther=panther[panther$Binom_Adjp_BH<0.001,]
panther=panther[panther$Binom_Fold_Enrichment>1.5,]

biocyc=biocyc[biocyc$Hyper_Adjp_BH<0.001,]
biocyc=biocyc[biocyc$Binom_Adjp_BH<0.001,]
biocyc=biocyc[biocyc$Binom_Fold_Enrichment>1.5,]

msigdb=msigdb[msigdb$Hyper_Adjp_BH<0.001,]
msigdb=msigdb[msigdb$Binom_Adjp_BH<0.001,]
msigdb=msigdb[msigdb$Binom_Fold_Enrichment>1.5,]


#combine all results 
sig_results=rbind(panther,biocyc,msigdb,go_mol,go_proc,go_cell)
write.csv(sig_results,file=paste(taskname,'great',sep='.'),quote=TRUE,sep='\t')


## -------------------------------------------------------------------------------------------------
#availableOntologies(job)
#availableCategories(job)

## ---- fig.width = 12, fig.height = 4, fig.align = 'center'----------------------------------------
#par(mfrow = c(1, 3))
#res = plotRegionGeneAssociationGraphs(job)
#res[1:2, ]

## ---- eval = FALSE--------------------------------------------------------------------------------
#  plotRegionGeneAssociationGraphs(job, type = 1)

## ---- fig.width = 12, fig.height = 4--------------------------------------------------------------
#par(mfrow = c(1, 3))
#res = plotRegionGeneAssociationGraphs(job, ontology = "GO Molecular Function",
#    termID = "GO:0004984")
#    res[1:2, ]

