rm(list=ls())
tasks=c("diff_d0_Y_vs_A.tsv.up.bed",
        "diff_d0_Y_vs_A.tsv.down.bed",
        "diff_d1_Y_vs_A.tsv.up.bed",
        "diff_d1_Y_vs_A.tsv.down.bed",
        "diff_d3_Y_vs_A.tsv.up.bed",
        "diff_d3_Y_vs_A.tsv.down.bed",
        "diff_d5_Y_vs_A.tsv.up.bed",
        "diff_d5_Y_vs_A.tsv.down.bed",
        "diff_d7_Y_vs_A.tsv.up.bed",
        "diff_d7_Y_vs_A.tsv.down.bed")
#options(warn = -1)
#suppressWarnings(suppressPackageStartupMessages(library(rGREAT)))
library(rGREAT)
#args <- commandArgs(TRUE)
#fname=args[1]
#taskname=args[2]
## -------------------------------------------------------------------------------------------------
set.seed(123)
for(taskname in tasks){
fname=taskname
bed=read.table(fname,header=FALSE,sep='\t')
eval=FALSE
curjob=submitGreatJob(bed,species="mm10",request_interval = 10)
#wait
curjob
tb = getEnrichmentTables(curjob)
names(tb)
go_tables = getEnrichmentTables(curjob, category = c("GO"))
go_mol=go_tables[1]$`GO Molecular Function`
go_proc=go_tables[2]$`GO Biological Process`
go_cell=go_tables[3]$`GO Cellular Component`

#Apply filters on 

go_mol=go_mol[go_mol$Hyper_Adjp_BH < 0.01,]
go_mol=go_mol[go_mol$Binom_Adjp_BH < 0.01,]
go_mol=go_mol[go_mol$Binom_Fold_Enrichment>2,] 


go_proc=go_proc[go_proc$Hyper_Adjp_BH<0.01,]
go_proc=go_proc[go_proc$Binom_Adjp_BH<0.01,]
go_proc=go_proc[go_proc$Binom_Fold_Enrichment>2,]

go_cell=go_cell[go_cell$Hyper_Adjp_BH<0.01,]
go_cell=go_cell[go_cell$Binom_Adjp_BH<0.01,]
go_cell=go_cell[go_cell$Binom_Fold_Enrichment>2,]


pathway_tables=getEnrichmentTables(curjob,category=c("Pathway Data"))
panther=pathway_tables[1]$`PANTHER Pathway`
biocyc=pathway_tables[2]$`BioCyc Pathway`
msigdb=pathway_tables[3]$`MSigDB Pathway`

panther=panther[panther$Hyper_Adjp_BH<0.01,]
panther=panther[panther$Binom_Adjp_BH<0.01,]
panther=panther[panther$Binom_Fold_Enrichment>2,]

biocyc=biocyc[biocyc$Hyper_Adjp_BH<0.01,]
biocyc=biocyc[biocyc$Binom_Adjp_BH<0.01,]
biocyc=biocyc[biocyc$Binom_Fold_Enrichment>2,]

msigdb=msigdb[msigdb$Hyper_Adjp_BH<0.01,]
msigdb=msigdb[msigdb$Binom_Adjp_BH<0.01,]
msigdb=msigdb[msigdb$Binom_Fold_Enrichment>2,]


#combine all results 
sig_results=rbind(panther,biocyc,msigdb,go_mol,go_proc,go_cell)
write.csv(sig_results,file=paste(taskname,'great',sep='.'),quote=TRUE,sep='\t')
}
