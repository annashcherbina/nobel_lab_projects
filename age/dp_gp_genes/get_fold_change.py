diff_genes=open("differential.age.rna.counts.txt.tpm",'r').read().strip().split('\n')
outf=open("dp_gp_gene_inputs.txt",'w')
outf.write("GeneID\tD0\tD1\tD3\tD5\tD7\n")
for line in diff_genes[1::]:
    tokens=line.split('\t')
    gene_id=tokens[0]
    d0_Old=float(tokens[2])
    d0_Y=float(tokens[3])
    try:
        d0_fold=d0_Old/d0_Y
    except:
        d0_fold=d0_Old

    d1_Old=float(tokens[5])
    d1_Y=float(tokens[6])
    try:
        d1_fold=d1_Old/d1_Y
    except:
        d1_fold=d1_Old


    d3_Old=float(tokens[7])
    d3_Y=float(tokens[8])
    try:
        d3_fold=d3_Old/d3_Y
    except:
        d3_fold=d3_Old

    d5_Old=float(tokens[9])
    d5_Y=float(tokens[10])
    try:
        d5_fold=d5_Old/d5_Y
    except:
        d5_fold=d5_Old

    d7_Old=float(tokens[5])
    d7_Y=float(tokens[6])
    try:
        d7_fold=d7_Old/d7_Y
    except:
        d7_fold=d7_Old

    outf.write(gene_id+'\t'+str(d0_fold)+'\t'+str(d1_fold)+'\t'+str(d3_fold)+'\t'+str(d5_fold)+'\t'+str(d7_fold)+'\n')
    
