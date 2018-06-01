#maps ensembl id's to gene names in DAVID enriched
import sys
data=open(sys.argv[1],'r').read().strip().split('\n')
map_file=open(sys.argv[2],'r').read().strip().split('\n')
name_map=dict()
for line in map_file:
    tokens=line.split('\t')
    g_id=tokens[0]
    g_name=tokens[1]
    name_map[g_id]=g_name
import pdb     
outf=open(sys.argv[1]+'.cleaned','w')
#print(data[0])
outf.write("Category\tTerm\tCount\tX.\tPValue\tList.Total\tPop.Hits\tPop.Total\tFold.Enrichment\tBonferroni\tBenjamini\tFDR\tGenes\n") 
for line in data[1::]:
    tokens=line.split('\"')
    gene_names=[name_map[i] for i in tokens[5].replace(' ','').split(',')]
    filtered=tokens[1]+','+tokens[3]+','+tokens[4]+','+tokens[6]
    filtered=filtered.replace(',','\t')
    filtered=filtered+'\t'+','.join(gene_names)
    while '\t\t' in filtered:
        filtered.replace('\t\t','\t')
    outf.write(filtered+'\n')
    
    
