peak_to_gene_young=open("ap1.unique.Young.nearest.tss.bed",'r').read().strip().split('\n')
peak_to_gene_aged=open("ap1.unique.Aged.nearest.tss.bed",'r').read().strip().split('\n') 
gene_to_expr=open("gene_corrected_tpm_expressed.txt",'r').read().strip().split('\n') 
gene_to_pval=open("RNA_diff_d0_Y_vs_A.tsv",'r').read().strip().split('\n') 
print("loaded all data")

gene_to_pval_dict=dict()
for line in gene_to_pval[1::]:
    tokens=line.split('\t')
    gene=tokens[0].split('_')[1]
    fdr=tokens[-2]
    gene_to_pval_dict[gene]=fdr
    
print("made gene to pval and fdr") 
gene_to_expr_dict=dict()
for line in gene_to_expr[1::]:
    tokens=line.split('\t')
    gene=tokens[0]
    aged_expr=float(tokens[1])
    young_expr=float(tokens[2])
    if aged_expr<=0:
        fold=max([0,young_expr])
    else:
        fold=max([0,young_expr])/aged_expr
    if gene in gene_to_pval_dict:
        pval=gene_to_pval_dict[gene]
    else:
        pval=1
    gene_to_expr_dict[gene]=[fold,pval]
print("made gene to expression & FDR dict")
outf=open("young.H4K20me1_to_gene_info.tsv",'w')
outf.write('chrom\tstart\tend\tGene\tFold\tFDR\n')
for line in peak_to_gene_young:
    tokens=line.split('\t')
    chrom=tokens[0]
    start=tokens[1]
    end=tokens[2]
    gene=tokens[-2]
    if gene not in gene_to_expr_dict:
        continue 
    fold=str(gene_to_expr_dict[gene][0])
    pval=str(gene_to_expr_dict[gene][1])
    outf.write('\t'.join([chrom,start,end,gene,fold,pval])+'\n')
outf.close()

outf=open("aged.H4K20me1_to_gene_info.tsv",'w')
outf.write('chrom\tstart\tend\tGene\tFold\tFDR\n')
for line in peak_to_gene_aged:
    tokens=line.split('\t')
    chrom=tokens[0]
    start=tokens[1]
    end=tokens[2]
    gene=tokens[-2]
    if gene not in gene_to_expr_dict:
        continue 
    fold=str(gene_to_expr_dict[gene][0])
    pval=str(gene_to_expr_dict[gene][1])
    outf.write('\t'.join([chrom,start,end,gene,fold,pval])+'\n')
outf.close()

        
