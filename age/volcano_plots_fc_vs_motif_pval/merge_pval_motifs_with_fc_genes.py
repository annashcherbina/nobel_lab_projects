import pdb
import statistics

motifs=open("significant.motifs.txt",'r').read().strip().split('\n')
genes=open("age.rna.fc.young.vs.old.csv",'r').read().strip().split('\n')
motif_dict=dict()
for line in motifs[1::]:
    tokens=line.split('\t')
    motif=tokens[1].lower()
    if motif not in motif_dict:
        motif_dict[motif]=[line]
    else:
        motif_dict[motif].append(line)


#get mapping of tf to family
family_map=open("tf_subset_to_family.txt",'r').read().strip().split('\n')
tf_to_family=dict()
for line in family_map:
    tokens=line.split('\t')
    tf_to_family[tokens[0].lower()]=tokens[-1]


#get median gene expression
gene_exp=open("gene_expression_for_gene_subset.txt",'r').read().strip().split('\n') 
expression_dict=dict()
for line in gene_exp:
    tokens=line.split('\t')
    gene=tokens[1]
    #get the median expression in young by day
    d0_young_indices=[10,11,12,13,14,15,16,17]
    d1_young_indices=[20,21,22,23,24,25]
    d3_young_indices=[33,34,35]
    d5_young_indices=[39,40,41]
    d7_young_indices=[44,45]
    d0_median=statistics.median([float(tokens[i]) for i in d0_young_indices])
    d1_median=statistics.median([float(tokens[i]) for i in d1_young_indices])
    d3_median=statistics.median([float(tokens[i]) for i in d3_young_indices])
    d5_median=statistics.median([float(tokens[i]) for i in d5_young_indices])
    d7_median=statistics.median([float(tokens[i]) for i in d7_young_indices])
    expression_dict[gene.lower()]=dict() 
    expression_dict[gene.lower()]['0']=d0_median
    expression_dict[gene.lower()]['1']=d1_median
    expression_dict[gene.lower()]['3']=d3_median
    expression_dict[gene.lower()]['5']=d5_median
    expression_dict[gene.lower()]['7']=d7_median
    
outf=open('motif_pval_to_gene_fc.txt','w')
outf.write('\t'.join(['TFFamily','MedianTPM','Day','Motif','-10log10Pval','Gene','d0_Y_v_O','d1_Y_v_O','d3_Y_v_O','d5_Y_v_O','d7_Y_v_O'])+'\n')


for line in genes[1::]:
    tokens=line.split('\t')
    gene=tokens[0].lower()
    if gene in motif_dict:
        for entry in motif_dict[gene]:
            entry_tokens=entry.split('\t')
            cur_day=entry_tokens[0]
            median_expression=expression_dict[gene][cur_day]            
            try:
                tf_family=tf_to_family[gene]
            except:
                tf_family="Unknown" 
            outf.write(str(tf_family)+'\t'+str(median_expression)+'\t'+entry+'\t'+line+'\n')
